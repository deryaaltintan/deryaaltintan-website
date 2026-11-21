function dort_sayinin_harmonik_ortalamasini_hesapla_input
clear all
clc
%x=input('Lütfen bir sayı giriniz');
%y=input('Lütfen bir sayı giriniz');
%z=input('Lütfen bir sayı giriniz');
%v=input('Lütfen bir sayı giriniz');
%harmonik_ortalama=4/((1/x)+1/(y)+1/(z)+1/(v));
%fprintf('Girilen sayıların ortalaması=%1.3f \n',harmonik_ortalama)
%disp(harmonik_ortalama)

A=input('Lütfen 4 sayidan oluşan bir vektör giriniz')
harmonik_ortalama_A=4/((1/A(1))+1/(A(2))+1/(A(3))+1/(A(4)));
fprintf('Girilen sayıların ortalaması=%1.3f \n',harmonik_ortalama_A)
