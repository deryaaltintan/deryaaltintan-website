const COURSES = {
  mat123: {
    prefix: "/materials/mat123/",
    secret: "MAT123_PASSWORD",
    title: "MAT123",
  },
  mat124: {
    prefix: "/materials/mat124/",
    secret: "MAT124_PASSWORD",
    title: "MAT124",
  },
  diff: {
    prefix: "/materials/diff/",
    secret: "DIFF_PASSWORD",
    title: "Differential Equations",
  },
};

const SESSION_SECONDS = 8 * 60 * 60;

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    if (url.pathname === "/__course_login" && request.method === "POST") {
      return handleLogin(request, env);
    }

    const courseEntry = Object.entries(COURSES).find(([, c]) =>
      url.pathname.startsWith(c.prefix)
    );

    if (!courseEntry) {
      return env.ASSETS.fetch(request);
    }

    const [courseKey, course] = courseEntry;

    // Fail closed if the Cloudflare secrets have not been configured yet.
    if (!env[course.secret] || !env.SESSION_SECRET) {
      return new Response(
        "Course-material protection is not configured yet.",
        { status: 503, headers: { "Cache-Control": "no-store" } }
      );
    }

    const token = getCookie(request, "course_auth");
    if (token && await verifyToken(token, courseKey, env.SESSION_SECRET)) {
      return env.ASSETS.fetch(request);
    }

    return loginPage(courseKey, url.pathname + url.search, course.title, false);
  },
};

async function handleLogin(request, env) {
  const form = await request.formData();
  const courseKey = String(form.get("course") || "");
  const password = String(form.get("password") || "");
  const next = String(form.get("next") || "");

  const course = COURSES[courseKey];
  if (!course || !next.startsWith(course.prefix)) {
    return new Response("Invalid request.", { status: 400 });
  }

  const expected = env[course.secret];
  if (!expected || !env.SESSION_SECRET) {
    return new Response(
      "Course-material protection is not configured yet.",
      { status: 503, headers: { "Cache-Control": "no-store" } }
    );
  }

  const ok = await safeEqual(password, expected);
  if (!ok) {
    return loginPage(courseKey, next, course.title, true);
  }

  const exp = Math.floor(Date.now() / 1000) + SESSION_SECONDS;
  const payload = `${courseKey}|${exp}`;
  const sig = await hmac(payload, env.SESSION_SECRET);
  const token = `${payload}|${sig}`;

  return new Response(null, {
    status: 303,
    headers: {
      "Location": next,
      "Set-Cookie":
        `course_auth=${encodeURIComponent(token)}; ` +
        `Path=${course.prefix}; Max-Age=${SESSION_SECONDS}; ` +
        "HttpOnly; Secure; SameSite=Lax",
      "Cache-Control": "no-store",
    },
  });
}

function loginPage(courseKey, next, title, hasError) {
  const safeNext = escapeHtml(next);
  const safeTitle = escapeHtml(title);

  const html = `<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>${safeTitle} · Protected Materials</title>
<style>
  :root{color-scheme:dark}
  *{box-sizing:border-box}
  body{
    margin:0;min-height:100vh;display:grid;place-items:center;
    font-family:Inter,system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;
    background:
      radial-gradient(circle at 20% 15%,rgba(81,124,255,.18),transparent 34%),
      radial-gradient(circle at 85% 75%,rgba(151,102,255,.16),transparent 30%),
      #061a2e;color:#f5f8ff;padding:24px
  }
  .card{
    width:min(520px,100%);padding:34px;border-radius:24px;
    background:rgba(12,43,72,.88);border:1px solid rgba(147,177,255,.28);
    box-shadow:0 22px 70px rgba(0,0,0,.32)
  }
  .eyebrow{color:#b9a0ff;font-weight:800;letter-spacing:.04em;margin-bottom:8px}
  h1{font-family:Georgia,serif;font-size:34px;margin:0 0 12px}
  p{line-height:1.55;color:#dce8f7;margin:0 0 24px}
  label{display:block;font-weight:700;margin-bottom:8px}
  input{
    width:100%;font-size:18px;padding:14px 16px;border-radius:12px;
    border:1px solid rgba(190,205,255,.4);background:#081f36;color:white;outline:none
  }
  input:focus{border-color:#8ba7ff;box-shadow:0 0 0 3px rgba(139,167,255,.15)}
  button{
    width:100%;margin-top:14px;padding:14px 18px;border:0;border-radius:12px;
    font-size:17px;font-weight:800;color:white;cursor:pointer;
    background:linear-gradient(90deg,#3f77ff,#7c5cff)
  }
  .error{
    margin:0 0 16px;padding:11px 13px;border-radius:10px;
    background:rgba(255,91,117,.13);border:1px solid rgba(255,132,151,.32);
    color:#ffdce3
  }
  .small{font-size:13px;color:#aebfd2;margin-top:16px}
</style>
</head>
<body>
  <main class="card">
    <div class="eyebrow">${safeTitle}</div>
    <h1>Ders materyali korumalı</h1>
    <p>PDF dosyasını açmak için ders şifresini girin.<br>
       Enter the course password to open this material.</p>
    ${hasError ? '<div class="error">Şifre yanlış. / Incorrect password.</div>' : ''}
    <form method="post" action="/__course_login">
      <input type="hidden" name="course" value="${escapeHtml(courseKey)}">
      <input type="hidden" name="next" value="${safeNext}">
      <label for="password">Şifre / Password</label>
      <input id="password" name="password" type="password" autocomplete="current-password" autofocus required>
      <button type="submit">Materyali Aç / Open Material</button>
    </form>
    <div class="small">Giriş bu tarayıcıda 8 saat geçerlidir.</div>
  </main>
</body>
</html>`;

  return new Response(html, {
    status: hasError ? 401 : 200,
    headers: {
      "Content-Type": "text/html; charset=utf-8",
      "Cache-Control": "no-store",
      "X-Robots-Tag": "noindex, nofollow, noarchive",
    },
  });
}

function getCookie(request, name) {
  const header = request.headers.get("Cookie") || "";
  for (const part of header.split(";")) {
    const [k, ...rest] = part.trim().split("=");
    if (k === name) return decodeURIComponent(rest.join("="));
  }
  return null;
}

async function verifyToken(token, expectedCourse, sessionSecret) {
  const parts = token.split("|");
  if (parts.length !== 3) return false;

  const [course, expText, sig] = parts;
  const exp = Number(expText);
  if (course !== expectedCourse || !Number.isFinite(exp)) return false;
  if (exp < Math.floor(Date.now() / 1000)) return false;

  const payload = `${course}|${exp}`;
  const expectedSig = await hmac(payload, sessionSecret);
  return safeEqual(sig, expectedSig);
}

async function hmac(message, secret) {
  const enc = new TextEncoder();
  const key = await crypto.subtle.importKey(
    "raw",
    enc.encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"]
  );
  const bytes = new Uint8Array(
    await crypto.subtle.sign("HMAC", key, enc.encode(message))
  );
  return base64url(bytes);
}

async function safeEqual(a, b) {
  const enc = new TextEncoder();
  const [ha, hb] = await Promise.all([
    crypto.subtle.digest("SHA-256", enc.encode(String(a))),
    crypto.subtle.digest("SHA-256", enc.encode(String(b))),
  ]);
  const aa = new Uint8Array(ha);
  const bb = new Uint8Array(hb);
  let diff = 0;
  for (let i = 0; i < aa.length; i++) diff |= aa[i] ^ bb[i];
  return diff === 0;
}

function base64url(bytes) {
  let s = "";
  for (const b of bytes) s += String.fromCharCode(b);
  return btoa(s).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
}

function escapeHtml(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}
