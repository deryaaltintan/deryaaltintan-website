function A=soru1(k)
%Verilen bir k  say?s? icin 1. s?tunu A(i,1)=f(i), A(i,2)=g(i) i=1,2,...,k
%i?in A matrisini olu?turan program? yaz?n?z f(x)=x^2, g(x)=x^3 k=3 i?in A
%matrisini elde ediniz. Cevap= A=[1 1; 4 8; 9 27] 
A=zeros(k,2)
for j=1:k
    A(j,1)=f(j)
    A(j,2)=g(j);
end


function z=f(x)
z=x^2

function t=g(x)
t=x^3

