%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% MTK 477 HAFTA 1%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 07/10/2026 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%Değişken tanımlama %%%%%%
clc
sayi1=4; % değişken isimlerinde boşluk, ?, %... gibi ifadeler olmamalıdır. 
sayi2=6;
ts=sayi1+sayi2;
fs=sayi1-sayi2;
us=sayi2^sayi1;

%MATEMATIK SABITLERI 
% ans: herhangi bir yere atanmayan değerleri gösterir answer kelimesinin
% kısaltmasıdır.
% pi: pi sayısını temsil eder 
% i : comple sayı gösterir
% Inf: sonsuz, -Inf: eksi sonsuzdur 
%NaN: (Not a number) tanımsız sayı 
% realmax: maimum reel sayi
%realmin: minimum reel sayi 


%intmin: 32 bitlik bir tam sayının alabileceği EN YÜKSEK DEĞERDİR. 
%intmax: 32 bitlik bir bilgisayarın alabileceği EN BÜYÜK DEĞERDİR
% AÇIKLAMA: n bitlik bir bilgisayar için en küçük  sayı -2^(n-1), en büyük
% sayi (2^(n-1)-1)
%Dolayısyla 32 bitlik bir bilgisayar için intmax=2^(32-1)-1= 2147483647.00
%intmin=-2^(32-1)=-2147483648.00

intmin;
intmax;
realmax;
realmin;
K=25/0;
L=0/0;
U=0*Inf;
M=Inf/Inf;

%%%%% MATLAB FONKSİYONLARI %%%%%%%%%%%%%%%%%%%%
%trigonometrik fonksiyonlar: sin, cos, tan, cot, sec, csc
%ters trigonometrik fonksiyonlar: arcsin, arccos, arctan, arccot, arcsec,arccsc

%%%Logaritma fonksiyonları ve üstel fonksiyonlar 
%log(): ln fonksiyonunu gösterir 
%log2(): 2 tabanında logaritma 
%log10(): 10 tabanında logaritma 
%exp(): üstel fonksiyon
%sqrt(): kök fonksiyonu
%nthroot: n. dereceden kök fonksiyonu 
%abs: mutlak değer fonksiyonu 

AS=sin(pi);
CS=cos(pi/2);
KL=exp(1);
KM=log(exp(1));
CL=exp(3);
MM=log(exp(3));
LL=log10(10^10);
HL=log2(3);
D=16;
SD=sqrt(D);
UD=nthroot(D,4);
g=-62;
ag=abs(g);

%%%%%%%%%%%%%%%  SAYI FORMATLARI %%%%%%%%%%%%%%%%%%
% format bank: ondalıklı form noktadan sonra iki sayi 
% format short: varsayilan format, ondalıklı sayı noktadan sonra 4 sayi
%format long: ondalik sayi noktadan sonra 15
% format rat: kesir formunda yazar 

format long;
pi ;
format short; 
pi; 
format rat 
pi ;
format bank 
pi;

% class: degişkenin tipini verir
%isa: değişkenin tipi sizin istediğiniz şekildeyse 1, değilse 0 verir.
LM=int32(3); 
uu=isa(LM,'double');
um=isa(LM,'integer');
LK=real(3.8);
uk=isa(LK,'integer');
class(pi);
class(6.7);
class(4);
k1='ali';
class(k1);
isa(k1,'char');
isa(k1,"integer"); 
isa(k1,"string");

%%% 08/10/2026 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=string('merhaba');
class(s);
s(1);
ss=string("dersimize hoş geldiniz");
class(ss);
ss(1);
Cs=char("dersimize hoş geldiniz");
class(Cs);
Cs(1);
%%%%%%%% Matrices vectors %%%%%%%%%%%%%%%%%
%Matrisler yazılırken satırlar arasına noktalı virgül konulur
%A matrisinin transpozu A' ile elde edilir
%size(A): ilk eleman satır sayısını ikinci eleman sütun sayısını verir 
M=[1 2 3 4;5 6 7 8;9 10 11 12];
K=M';
[satir,sutun]=size(M);
A=[1;2; 3 ;4];
M(3,4);
M(2,:);
M(:,4);
b=[10 20 30 40];
sb=size(b);
lb=length(b);
%%%%%%%%%%%%%% Klavyeden veri girmek %%%%%%%%%%%%%%
%input: klavye aracılığıyla veri aktarmada kullanılır 
%yas=input('Lütfen yaşınızı giriniz: ') ;%sadece sayısal sonuç ister metin yazılırsa hata verir 
%isim=input('Adınız nedir ? ','s') %eger cevap metin olarak girilecekse sonuna 's' konulmalıdır

%disp: ekrana yazı yazmak için kullanılır
%disp('Üzgünüm ! sifira bölme hatası var');
%disp('Hacettepe Matematik bölümü Matlab Dersi')
satir_vekt=[10 11 12];
%disp(satir_vekt) %vektörü yazar 
%disp("satir_vekt")% sadece satir_vekt yazar 
U=[-9 7 8 6;1 5 7 4;-3 -6 -9 85];
%disp(U);

%num2str: sayisal verileri karakterlere çevirir
%tahmin=input('Lütfen bir sayi giriniz ')
%disp(['Girdiğiniz sayi',num2str(tahmin),' dir'])
%isim=input("Lütfen adınızı yazınız",'s')
%disp(['İsminiz',isim,'dir'])


%fprintf(format, değişkenler)
% %c: tek bir karakter
% %s: karakter dizisi
% %d: tam sayi
% %f: ondalikli sayi 
% %g: en kompakt form
% \n: satir atlar

karakter='ali gel';
isim='ahmet';
tamsayi=25;
ondalik_sayi=1.8;
u=pi;
%fprintf('Tanımlanan=%c \n',karakter)
%fprintf('Tanımlanan karakter=%s',karakter)
%fprintf('Tanımlanan isim %d \n',isim)
%fprintf('Tanımlanan ondalık sayı %f dir',ondalik_sayi)
%fprintf('Tanımlanan ondalık sayi %.5f şeklindedir',u)
%fprintf('Tanımlanan ifade %s dir. \n Tanımlanan kişi %s  dir.\n Tanımlanan sayi %d dir. \n Tanımlanan diger sayi %.2f',karakter,isim,tamsayi,ondalik_sayi)


%f ilgili değişkenin ondalikli olduğunu gösterir 
% %.kf : noktadan sonra k basamak olacaktır
% %t.kf: noktadan önce t, noktadan sonra k karakter yazar
% %ud: u birim sağa kaydırır

%fprintf('pi sayisinin değeri %f \n',pi)
%fprintf('pi sayisinin değeri %.3f \n',pi)
%fprintf('pi sayisinin değeri %6.3f \n',pi)
%fprintf('Merhaba%10s \n','Dunya')
%fprintf('Merhaba%s \n','Dunya')
%fprintf('Merhaba %s \n','Dunya')
%fprintf('Merhaba%15s \n','Dunya')
%fprintf('%d \n',123)
%fprintf('%8d \n',123)
%fprintf('%2d \n',123)
fprintf('%9d * 8 + %d=%d \n',123,3,987)
fprintf('%-9d * 8 + %d=%d \n',123,3,987)


