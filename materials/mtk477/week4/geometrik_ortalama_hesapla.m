function geometrik_ortalama_hesapla
% sayi1 ve sayi2 sayılarının geometrik ortalamasını=sqrt(sayi1,sayi2) olarak hesaplar
sayi1=input('Lütfen bir tamsayi giriniz')
sayi2=input('Lütfen bir tamsayi giriniz')
gort=(sayi1*sayi2)^(1/2)
fprintf('Girilen sayilar %d %d dir. Geometrik ortalama ise %1.3f \n',sayi1,sayi2,gort)