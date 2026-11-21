function isim
clc
isim=input('Bir isim giriniz: ');% || veya
if strcmp(isim,'ali') || strcmp(isim,'kerem')
    disp('A')
elseif strcmp(isim,'ayşe') || strcmp(isim,'derya')
    disp('B')
else
    disp('C')
end