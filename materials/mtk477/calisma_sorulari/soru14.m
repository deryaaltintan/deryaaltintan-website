function Z=soru14(n)
%verilen bir n sayisi icin n<10 ise verilen sayi ile 20 arasindaki
%sayilari toplayan, verilen sayi 10 ile 20(20 dahil) arasinda ise n ile 20
%arasindaki sayilarin carpimini elde eden, verilen sayi 20 den buyukse
%sayinin kendisini veren algoritmayi sadece switch,while,if  looplari kullanarak
%yaziniz n=9; n=11; ve n=25 icin sonuclari elde ediniz. Cevap: n=9 icin
%154,n=11 icin  6.0340e+13, n=25 icin 25.
if n<10
    K=1;
elseif n>=10 && n<=20
    K=2;
else 
    K=3;
end

switch K
    case 1
        Z=0;
        sayac=n;
        while sayac<20
            Z=Z+sayac;
            sayac=sayac+1;
        end 
        
    case 2 
        Z=1;
        sayac=n;
        while sayac<=20
           Z=Z*sayac;
           sayac=sayac+1
        end 
    case 3 
        Z=n;
end
            
