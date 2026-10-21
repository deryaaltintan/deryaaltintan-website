function [b,c]=soru12(altsinir,ustsinir,h)
%Verilen bir altsinir,ustsinir,h sayilari icin. a=altsinir:h:ustsinir,
%b(a)=3*a^2+3*a-5,  c(a)=1.2*a^2+4*a-3 olmak uzere a,b,c vektorlerini elde
%ediniz ve (a,b), (a,c) ikililerini ust uste c?ziniz
%altsinir=0,ustsinir=5, h=0.5 olmak uzere cizimleri yapiniz. 
s=1;
for a=altsinir:h:ustsinir
    b(s)=3*a^2+3*a-5
    c(s)=1.2*a^2+4*a-3
    s=s+1
end 
a=altsinir:h:ustsinir
plot(a,b,'-or','MarkerFaceColor','g','LineWidth',2)
hold on 
plot(a,c,'--ok','MarkerFaceColor','c','LineWidth',2)
    
    