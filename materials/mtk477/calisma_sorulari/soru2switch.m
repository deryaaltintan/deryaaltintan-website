function y=soru2switch(x)
%f(x)=x+2 x<-2, -|x|+5 2<=x<3, x-4 x>=3 fonksiyonunu switch case  ile yaz?n?z 
if x<-2
    ZZ=1;
elseif le(-2,x) && le(x,3);
    ZZ=2;
else 
    ZZ=3;
end

switch ZZ
    case 1
        y=x+3;
    case 2
         y=-abs(x)+5;
    case 3 
        y=x-4;
end 
          
    
    