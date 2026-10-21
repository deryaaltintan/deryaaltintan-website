%Kenar? j=1,2,...,x seklindeki karelerin alanlarini bulan ve bu alanlar? bir
%vektorun bilesenleri olarak yazan programi while loop kullanarak yaziniz.
%x=7 icin cevabi elde ediniz. Cevap:  A=[1 4 9 16 25 36 49 ]
function A=soru5while(x)
A=zeros(1,x)
sayac=1
while sayac<=x
    A(sayac)=sayac^2
    sayac=sayac+1
end