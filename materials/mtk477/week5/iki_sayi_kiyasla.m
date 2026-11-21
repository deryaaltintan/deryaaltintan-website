function iki_sayi_kiyasla(sayi1,sayi2)
if sayi1>sayi2
    fprintf('%d sayisi %d sayisindan büyüktür \n', sayi1,sayi2)
    %disp(fprintf('%d sayisi %d sayisindan büyüktür \n', sayi1,sayi2))
elseif sayi1<sayi2
    fprintf('%d sayisi %d sayisindan küçüktür \n', sayi1,sayi2)
else
      fprintf('%d sayisi ile %d sayisi eşittir \n', sayi1,sayi2)
end 