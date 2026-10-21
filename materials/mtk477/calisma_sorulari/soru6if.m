function C=soru6if(A,B)
%Verilen A,B vekt?rleri i?in  A ve B nin boylarini karsilastirarak C vektorunu olusturan fonksiyonu  yazmak istiyoruz. 
%Buna gore,  eger A ile B'nin boylari esit ve k olmak ?zere C vektorunun boyu da k'd?r. Ayrica A(j) tek, B(j) cift ise C(j)=A(j)*B(j)
%,A(j) cift, B(j) tek  ise C(j)=A(j)/B(j) seklindedir. Eger A'nin boyu
%B'den buyukse C=A, degilse C=B seklindedir. Bu programi if kullanarak yaziniz.  Bu program A=[1 2 5];B=[6 7 9]
%icin C'yi ne verir ? Cevap=C=[1/6 14 5/9]

if length(A)==length(B)
    C=zeros(1,length(A))
    for j=1:length(B)
        if ~mod(A(1,j),2) && mod(B(1,j),2)
            C(1,j)=A(1,j)*B(1,j)
        else
            C(1,j)=A(1,j)/B(1,j)
        end
    end
elseif length(A)>length(B)
    C=A;
else
    C=B
end
           