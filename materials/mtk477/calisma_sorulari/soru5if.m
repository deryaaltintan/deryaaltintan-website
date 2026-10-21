%Kenar? j=1,2,...,x seklindeki karelerin alanlarini bulan ve bu alanlar? bir
%vektorun bilesenleri olarak yazan programi if loop kullanarak yaziniz.
%x=7 icin cevabi elde ediniz.Cevap: A=[1 4 9 16 25 36 49 ]
function A=soru5if(x)
A=zeros(1,x)
for j=1:x
    A(j)=j^2
end