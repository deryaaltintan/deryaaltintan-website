%Dünyaya geldiğimiz an 0 (sıfır) başlangıç değeri olmak üzere ve değeri her
%saniye 1 artıran bir sayaca sahip olduğunuzu düşününüz. Böyle bir sayacın
%ekranında gördüğünüz değere ulaşmak için kaç gün, kaç saat, kaç dakika
%süreyle sayma işlemi gerçekleştirdiğini hesaplayacak programı yazınız
% Not: 1 dakika=60 saniye, 1 saat=60 dakika=3600 saniye, 1 gün=86400 saniye
%Yazan : Derya Altıntan 
function [gun,saat,dakika,saniye]=saniye_sayacini_hesapla(sayac)
gun= floor(sayac/86400);
ardakalan=mod(sayac,86400);% mod(a,m) a'nın mod m'ye göre degerini belirler. 
%Bunu yerine ardakaln=sayac-gun*86400
saat=floor(ardakalan/3600);
ardakalan2=mod(ardakalan,3600);
dakika=floor(ardakalan2/60);
saniye=mod(ardakalan2,60);
fprintf('Gün sayısı %d \n',gun)
fprintf('Saat sayısı %d \n',saat)
fprintf('Dakika sayısı %d \n',dakika)
fprintf('Saniye sayısı %d \n',saniye)