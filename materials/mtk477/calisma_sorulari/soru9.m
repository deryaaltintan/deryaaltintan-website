%Verilen her hangi bir A matrisinin t?m elemanlar?n? toplayan bir algoritma
%olusturunuz? A=[1 2 3; 4  5 6 ; 7 8 9] matrisi icin cevab?  elde ediniz
%Cevap=45
 

function toplam=soru9(A)
[r,c]=size(A)
toplam=0;
for i=1:r
    for j=1:c
        toplam=toplam+A(i,j)
    end 
end 