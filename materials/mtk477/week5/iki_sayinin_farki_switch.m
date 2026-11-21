function [fark,z]=iki_sayinin_farki_switch(sayi1,sayi2)
fark=sayi1-sayi2;
b=sign(fark);

switch b
    case -1
        z=10;
    case 1
        z=20;
    otherwise
        z=20;
end 
z





