function [y,z]=h(x)
%[y,z]=h(x) fonksiyonu x sayısının pozitif, negatif ve 0 olmasına göre 
%y ve z sayılarını belirler 
if (x<0)
    y=-1;
    z=-x;
elseif(x>0)
    y=1;
    z=x;
else
    y=0;
    z=0;
end