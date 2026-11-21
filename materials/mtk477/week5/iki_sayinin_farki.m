function [fark,z]=iki_sayinin_farki
sayi1=input('Lütfen bir sayi giriniz');
sayi2=input('Lütfen bir sayi giriniz');
fark=sayi1-sayi2;
if fark<0
    z=10;
elseif fark>0
    z=20;
else
    z=30;
end 
z