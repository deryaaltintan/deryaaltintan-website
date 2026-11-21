
function SwitchCase
operator=input('Bir aritmetik operatör(karakter) giriniz:','s');
switch operator
    case '+'
        disp('MATLAB''in toplama operatorünü girdiniz')
    case '-'
        disp('MATLAB''in çıkarma operatorünü girdiniz')
    case '*'
        disp('MATLAB''in çarpma operatorünü girdiniz')
    case '/'
        disp('MATLAB''in bölme operatorünü girdiniz')
    otherwise
         disp('MATLAB''da tanımlı bir operatör girmediniz ')
end



%function IfElseifEnd

%operator=input('Bir aritmetik karakter giriniz','s')
%if operator=='+' % = eşittir koşul belirtirken == şeklinde gösterilir
 %   disp('MATLAB''in toplama operatorünü girdiniz')
%elseif operator=='-'
 %   disp('MATLAB''in çıkarma operatorünü girdiniz')
%elseif operator=='*'
 %  disp('MATLAB''in çarpma operatorünü girdiniz')
%elseif operator=='/'
 %   disp('MATLAB''in bölme operatorünü girdiniz')
%else
 %    disp('MATLAB''da tanımlı bir operatör girmediniz ')
%end