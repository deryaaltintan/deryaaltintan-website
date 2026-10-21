function y=soru13(x)
% f fonksiyonu eger u<-1 ise y=u+3, -1<=u<=3 ise y=4u-1, u>3 ise y=1-u
% olarak  tanimlidir. 
% g fonksiyonu ise x<=2 ise z=2-x, x>2 ise z=2x-3 olarak tanimlidir. Bu
% durumda (fog)(x) fonksiyonunun algoritmasini yaziniz ve (fog)(0) degerini
% hesaplayiniz. Cevap=7
u=g(x);
if u<-1
    y=u+3;
elseif -1<=u && u<=3 
    y=4*u-1;
else
    y=1-u;
end 



function z=g(x)
if x<=2
    z=2-x;
else
    z=2*x-3;
end



