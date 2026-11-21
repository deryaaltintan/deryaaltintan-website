function while_loop_isim_yazma
adsoyad=input('Lütfen isim ve soyisim giriniz','s');
tekrarsayaci=input('Ekrana kaç kez isminiz yazılsın giriniz');
j=1;
while j<=tekrarsayaci
    fprintf('%s \n',adsoyad)
    j=j+1;
end
