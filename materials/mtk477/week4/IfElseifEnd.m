function IfElseifEnd
clc
operator=input('Bir aritmetik karakter giriniz','s')
if operator=='+' % = eşittir koşul belirtirken == şeklinde gösterilir
    disp('MATLAB''in toplama operatorünü girdiniz')
elseif operator=='-'
    disp('MATLAB''in çıkarma operatorünü girdiniz')
elseif operator=='*'
   disp('MATLAB''in çarpma operatorünü girdiniz')
elseif operator=='/'
    disp('MATLAB''in bölme operatorünü girdiniz')
else
     disp('MATLAB''da tanımlı bir operatör girmediniz ')
end