%Verilen bir sayi dizisi i?in X(1)=X1;X(2)=X2; seklinde belirlenmistir. Bu
%durumda verilen bir F(x,y) fonksiyonu icin X(k+1)=F(X(k),X(k-1)) olan
%fonksiyonu |X(k+1)+X(k)|<K oldugu s?rece elde ediniz. X1=1;X2=2;K=50 olmak
%uzere X vektorunu elde ediniz. Cevap=X=[1 2 3 5 8 13 21 34] 

function X=soru8(X1,X2,K)
X=[];
X(1)=X1;
X(2)=X2;
sayac=3;
while abs(X(sayac-1)+X(sayac-2))<K 
    X(sayac)=F(X(sayac-1),X(sayac-2));
    sayac=sayac+1;
end












function z=F(x,y)
z=x+y;


