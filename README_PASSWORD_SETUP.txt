DERS MATERYALLERİ ŞİFRE KORUMASI

Bu paket ana siteyi ve ders bilgi sayfalarını açık bırakır.
Sadece şu klasörlerin altındaki dosyalar şifre ister:
- /materials/mat123/*
- /materials/mat124/*
- /materials/diff/*

1) ZIP içindeki worker klasörünü ve wrangler.jsonc dosyasını
   GitHub repo'nun EN ÜST klasörüne kopyalayın.
   Mevcut wrangler.jsonc varsa yenisiyle değiştirin.

2) Commit + Push yapın.
   Cloudflare otomatik deploy eder. Şifreler henüz tanımlı değilse
   korunan materyaller 503 verir; açık hale GELMEZ.

3) Cloudflare Worker ayarlarında aşağıdaki dört değeri SECRET olarak ekleyin:
   MAT123_PASSWORD
   MAT124_PASSWORD
   DIFF_PASSWORD
   SESSION_SECRET

   İlk üçüne ders şifrelerini girin.
   SESSION_SECRET için uzun, rastgele bir değer kullanın
   (örneğin parola yöneticisinin ürettiği 40+ karakterlik rastgele bir dize).

4) Secret'ları ekledikten sonra materyal PDF'lerinden birine tıklayıp test edin.

ÖNEMLİ:
- Şifreler worker/index.js veya wrangler.jsonc içine YAZILMADI.
- Ana Teaching sayfası ve ders içerikleri açık kalır.
- Lecture notes, exercise sheets, exams ve aynı ders klasörüne koyacağınız
  gelecekteki tüm PDF/dosyalar otomatik olarak korunur.
- Gelecekte yeni bir ders dosyası yüklerken mutlaka ilgili klasöre koyun:
  materials/mat123, materials/mat124 veya materials/diff.
- Giriş oturumu 8 saat sürer.
