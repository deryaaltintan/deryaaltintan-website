const COURSES = {
  mat123: { prefix: "/materials/mat123/", secret: "MAT123_PASSWORD", title: "MAT123" },
  mat124: { prefix: "/materials/mat124/", secret: "MAT124_PASSWORD", title: "MAT124" },
  diff: { prefix: "/materials/diff/", secret: "DIFF_PASSWORD", title: "Differential Equations" }
};

const SESSION_SECONDS = 8 * 60 * 60;

function getCourseByPath(pathname) {
  for (const [key, cfg] of Object.entries(COURSES)) {
    if (pathname.startsWith(cfg.prefix)) return { key, ...cfg };
  }
  return null;
}

function getCookie(request, name) {
  const cookie = request.headers.get("Cookie") || "";
  for (const part of cookie.split(";")) {
    const [k, ...rest] = part.trim().split("=");
    if (k === name) return rest.join("=");
  }
  return null;
}

function b64url(bytes) {
  let s = "";
  for (const b of new Uint8Array(bytes)) s += String.fromCharCode(b);
  return btoa(s).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
}

async function sign(secret, message) {
  const key = await crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"]
  );
  return b64url(await crypto.subtle.sign("HMAC", key, new TextEncoder().encode(message)));
}

async function makeToken(env, courseKey) {
  const exp = Math.floor(Date.now() / 1000) + SESSION_SECONDS;
  const body = `${courseKey}.${exp}`;
  return `${body}.${await sign(env.SESSION_SECRET, body)}`;
}

async function validToken(env, token, courseKey) {
  if (!token || !env.SESSION_SECRET) return false;
  const parts = token.split(".");
  if (parts.length !== 3) return false;
  const [key, expRaw, sig] = parts;
  if (key !== courseKey) return false;
  const exp = Number(expRaw);
  if (!Number.isFinite(exp) || exp < Math.floor(Date.now() / 1000)) return false;
  const expected = await sign(env.SESSION_SECRET, `${key}.${expRaw}`);
  if (sig.length !== expected.length) return false;
  let diff = 0;
  for (let i = 0; i < sig.length; i++) diff |= sig.charCodeAt(i) ^ expected.charCodeAt(i);
  return diff === 0;
}

function safeReturnTo(value, course) {
  try {
    const u = new URL(value, "https://example.invalid");
    if (u.pathname.startsWith(course.prefix)) return u.pathname;
  } catch {}
  return `${course.prefix}index.html`;
}

function langFrom(url, form = null) {
  const q = (url.searchParams.get("lang") || form?.get("lang") || "").toLowerCase();
  return q === "tr" ? "tr" : "en";
}

function loginPage(course, returnTo, lang, wrong = false) {
  const tr = lang === "tr";
  const title = tr ? "Ders materyalleri korumalı" : "Protected course materials";
  const intro = tr
    ? "Bu dersin tüm materyallerini açmak için ders şifresini girin."
    : "Enter the course password to open all materials for this course.";
  const label = tr ? "Şifre" : "Password";
  const button = tr ? "Ders Materyallerini Aç" : "Open Course Materials";
  const duration = tr
    ? "Giriş bu tarayıcıda 8 saat geçerlidir."
    : "Access remains valid in this browser for 8 hours.";
  const error = tr ? "Şifre yanlış. Lütfen tekrar deneyin." : "Incorrect password. Please try again.";

  return new Response(`<!doctype html>
<html lang="${lang}">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="robots" content="noindex,nofollow,noarchive">
<title>${course.title} · ${title}</title>
<style>
:root{--bg:#071b31;--panel:#0d2d4a;--text:#f5f8ff;--muted:#b4c7de;--violet:#7e56ff;--blue:#4778ff;--line:#365f8e}
*{box-sizing:border-box}
body{margin:0;min-height:100vh;display:grid;place-items:center;padding:24px;background:linear-gradient(135deg,#07192c,#092743);font-family:Inter,system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;color:var(--text)}
.card{width:min(720px,100%);border:1px solid var(--line);border-radius:28px;padding:42px 48px;background:rgba(10,43,70,.94);box-shadow:0 22px 60px rgba(0,0,0,.20)}
.code{font-size:.95rem;font-weight:900;letter-spacing:.06em;color:#b59cff;margin-bottom:14px}
h1{font:700 clamp(1.8rem,3.2vw,2.8rem)/1.08 Georgia,"Times New Roman",serif;margin:0 0 16px}
p{font-size:1.05rem;line-height:1.5;color:#d3e0ef;margin:0 0 28px}
label{display:block;font-size:1rem;font-weight:900;margin-bottom:9px}
input{width:100%;font-size:1.05rem;padding:15px 17px;border-radius:14px;border:2px solid #779aff;background:#09243d;color:white;outline:none;box-shadow:0 0 0 4px rgba(81,112,220,.16)}
button{width:100%;border:0;border-radius:14px;margin-top:20px;padding:16px 18px;color:white;font-size:1.05rem;font-weight:900;cursor:pointer;background:linear-gradient(90deg,var(--blue),var(--violet))}
.small{font-size:.9rem;color:var(--muted);margin:20px 0 0}
.error{font-size:.92rem;color:#ffd2dc;margin:13px 0 0;font-weight:800}
@media(max-width:700px){body{padding:18px}.card{padding:30px 22px;border-radius:22px}h1{font-size:1.9rem}p{font-size:1rem;margin-bottom:24px}}
</style>
</head>
<body>
<main class="card">
<div class="code">${course.title}</div>
<h1>${title}</h1>
<p>${intro}</p>
<form method="post" action="/__course_login">
<input type="hidden" name="course" value="${course.key}">
<input type="hidden" name="returnTo" value="${returnTo}">
<input type="hidden" name="lang" value="${lang}">
<label for="password">${label}</label>
<input id="password" name="password" type="password" autocomplete="current-password" required autofocus>
<button type="submit">${button}</button>
${wrong ? `<div class="error">${error}</div>` : ""}
</form>
<div class="small">${duration}</div>
</main>
</body>
</html>`, {
    status: wrong ? 401 : 200,
    headers: { "content-type": "text/html; charset=UTF-8", "cache-control": "no-store" }
  });
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    if (url.pathname === "/__course_login" && request.method === "POST") {
      const form = await request.formData();
      const key = String(form.get("course") || "");
      const course = key && COURSES[key] ? { key, ...COURSES[key] } : null;
      if (!course) return new Response("Bad request", { status: 400 });

      const lang = langFrom(url, form);
      const returnTo = safeReturnTo(String(form.get("returnTo") || ""), course);
      const supplied = String(form.get("password") || "");
      const expected = env[course.secret];

      if (!expected || !env.SESSION_SECRET) {
        return new Response("Course authentication is not configured.", { status: 503 });
      }

      if (supplied !== expected) {
        return loginPage(course, returnTo, lang, true);
      }

      const token = await makeToken(env, key);
      const headers = new Headers();
      headers.set("Location", returnTo);
      headers.append(
        "Set-Cookie",
        `course_${key}=${token}; Max-Age=${SESSION_SECONDS}; Path=${course.prefix}; HttpOnly; Secure; SameSite=Lax`
      );
      return new Response(null, { status: 303, headers });
    }

    const course = getCourseByPath(url.pathname);
    if (!course) return env.ASSETS.fetch(request);

    // Fail closed if the required runtime secrets are missing.
    if (!env[course.secret] || !env.SESSION_SECRET) {
      return new Response("Course authentication is not configured.", { status: 503 });
    }

    const token = getCookie(request, `course_${course.key}`);
    if (await validToken(env, token, course.key)) {
      return env.ASSETS.fetch(request);
    }

    const lang = langFrom(url);
    return loginPage(course, url.pathname, lang, false);
  }
};
