function y=soru2if(x)
%f(x)=x+2 x<-2, -|x|+5 2<=x<3, x-4 x>=3 fonksiyonunu if ile yaz?n?z 
if x<-2
    y=x+3;
elseif le(-2,x) && le(x,3);
    y=-abs(x)+5;
else 
    y=x-4;
end
    