function for_loop_isim_yazma
adsoyad=input('Lütfen isim ve soyisim giriniz','s');
tekrarsayaci=input('Ekrana kaç kez isminiz yazılsın giriniz');
for i=1:tekrarsayaci
    fprintf('%s \n',adsoyad)
end
