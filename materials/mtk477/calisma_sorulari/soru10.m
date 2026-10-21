function carpim=soru10(A,n)
%Verilen bir A matrisini ve n say?s? i?in n. sat?rdaki elemanlar?n birbiriyle carp?m?n? bulan algoritmay? yaz?n?z? 
% Kullan?c? eger A matrisinin sat?r say?s?ndan cok fazla bir sayi verdiyse
% kullaniciyi uyariniz. 
%A=[1 2 3; 4  5 6 ; 7 8 9], n=3 icin cevab?  elde ediniz
%Cevap=504
 
[r,c]=size(A);
carpim=1;
if r<n
    disp('yanlis sayi girdiniz')
else 
    for j=1:c 
        carpim=carpim*A(n,j); 
    end 
end 

