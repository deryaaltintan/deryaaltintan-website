function iki_sayi_kiyasla_switch(sayi1,sayi2)
a=sayi1-sayi2;
b=sign(a);
switch b
    case 1
 fprintf('%d sayisi %d sayisindan büyüktür \n', sayi1,sayi2)
    case -1
 fprintf('%d sayisi %d sayisindan küçüktür \n', sayi1,sayi2)
    otherwise
      fprintf('%d sayisi ile %d sayisi eşittir \n', sayi1,sayi2)
end 





