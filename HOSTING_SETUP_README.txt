DERYA ALTINTAN ACADEMIC SITE — HOSTING-READY

Recommended stack:
1. GitHub repository (stores site and PDFs)
2. Cloudflare Pages (hosts/deploys automatically)
3. Pages CMS (simple editor for announcements and PDF uploads)

Daily use:
- Open app.pagescms.org and sign in with GitHub.
- Open “Günlük Site Güncellemeleri”.
- For an announcement: add an item under Duyurular, fill TR/EN, save.
- For a PDF: add an item under Yeni / Ek Ders Materyalleri, select course, upload PDF, add TR/EN title, save.
- Cloudflare Pages redeploys automatically from GitHub.

Important security note:
The current course pages are hash sections (#mat123, #mat124, #diffeq) inside the same index.html. Server-side password protection cannot securely protect only a URL fragment. Before enabling real course passwords, course pages should be split into separate paths/files (e.g. /courses/mat123/) and protected at the edge/server level. Do not embed shared passwords in JavaScript/HTML.
