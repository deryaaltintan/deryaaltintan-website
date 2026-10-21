function C=soru3(A,B)
% verilen iki vekt?r i?in ?nce vekt?rlerin boyunu k?yaslayan boylar? e?itse
% ve k kadarsa 2 sat?rl? k s?tunlu bir C matris, olu?turan program? yaz?n?z.
% Ard?ndan C matrisinin 1. sat?r elemanlar?n? C(1,j)=F(A(j)), 2. sat?r elemanlar?n? ise 
%C(2,j)=1/F(B(j)) olarak olu?turunuz. F(x)= 1/x ;  A=[1 2 3]; B=[4 5 7 ]
%olmak uzere C matrisini olusturunuz Cevap= C=[1 1/4 1/9; 4 5 7] 
if length(A)==length(B)
    C=zeros(2,length(A))
    for j=1:length(A)
        C(1,j)=(F(A(j)))^2;
        C(2,j)=1/(F(B(j)));
    end 
else
    fprintf('Esit boyutlu matris giriniz')
end 



function y=F(x)
y=1/x;


   
    
    
    
    
    
    
    
    
    
    

