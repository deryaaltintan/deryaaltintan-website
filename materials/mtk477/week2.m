%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MTK 477 HAFTA 2%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%VEKTÖRLER VE MATRİSLER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%14/10/2026%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;close all
v=[1 2 3 4 ]; %satır vektörü
v1=v';%v' vnin transpozunu alır
v2=[5;6;7;8];%sütun vektörü oluşturur
length(v2);%sadece vektörlerde kullanılır eleman sayısını verir
size(v2);% satır sütun sayısını verir
v3=1:3:10; %v3=v3_ilk:artıs miktari:v3_son
v4=-100:20:0;
v5=v4';
v6=linspace(-1,9,2); % v=linspace(v_ilk,v_son,eleman sayısı)
v7=linspace(-1,9,4);
v8=logspace(1,5,4);%v=logsapce(v_ilk,v_son,eleman sayısı) logaritmik artısa göre 10^(v_ilk) ve 10^(v_son)
v9=logspace(-1,1,3);

%rand(m,n):m satırlı n sütunlu tekdüze dağılımlı (uniform distribution) sayılar yaratır
A=rand(2,3) ;
%zeros(m,n): m satırlı n sütunlu sadece 0'lardan oluşan matris üretir
%ones(m,n):m satırlı n sütunlu sadece 1'lardan oluşan matris üretir
A1=zeros(2,3);
A2=ones(3,4);
%eye(m):m satırlı m sütunlu birim matris yaratır
A3=eye(2);
%min: vektörün minimumunu bulur 
%max:vektörün maimumunu bulur
%sum: vektör elemanlarının toplamını elde eder
%prod: vektör elemanlarının çarpımını elde eder
%sort: vektör elemanlarını sıralar 
v10=[1 -9 7 65 4 3 29 0 12];
max_v10=max(v10);
min_v10=min(v10);
sum_v10=sum(v10);
prod_v10=prod(v10);
sort_v10=sort(v10);
%Ayrica sayilar için 
%sign(x):   x pozitifse 1, negatifse -1, x=0 sa 0 yaratır 
%fix(x): x in sıfıra doğru en yakın değerini verir
%ceil(x):x in + sonsuza doğru tam değerini verir (tavan fonksiyonu)
%floor(x): x in - sonsuza doğru tam değerini verir (taban fonksiyonu)
%round(x): x'i yuvarlar
x=[3.4  3.6];
signx=sign(x);
fixx=fix(x);
roundx=round(x);
floorx=floor(x);
ceilx=ceil(x);



y=[-3.4  -3.6];
signy=sign(y);
fixy=fix(y);
roundy=round(y);
floory=floor(y);
ceily=ceil(y);

%%%%%%%%%% MATRİSLERDE İŞLEMLER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AS=[1 2 3;4 5 6];
BS=[10 20 30;40 50 60];
CS=[-1 -2 -3]';
ABS=AS+BS; % matrisleri toplar
ABSF=AS-BS; % matrisleri çıkarır
ACS=AS*CS; % matrisleri çarpar
DS=[1 2 ;3 4];
tersDS=inv(DS); % inv(X): X matrisinin tersini bulur
determinantDS=det(DS); %det(X): X matrisinin determinantını hesaplar 
boyutDS=size(DS);%size(X): X matrisnin boyutunu bulur

%c=dot(a,b) a ve b'nin elemanlarının skaler çarpımını alır
a=[1 2 3 4];
b=[4 3 2 1];
c=dot(a,b);
CSS=dot(AS,BS);
%Sistem çözümü 
%Ax=b'nin çözümü için x=inv(A)*b, ya da x=A\b şeklinde hesaplanır
A=[1 -5;7 6];
b=[-4;13];
x=inv(A)*b;
y=A\b;
%Eleman eleman işlemler 
a1=[3 7 8 10];
b1=[6 2 -2 -2];
k1=a1.*b1; %elemanları karşılıklı çarpar
k2=a1.\b1;%elemanları karşılıklı böler
k21=b1./a1;
k3=a1.^b1;%elemanları karşılıklı olarak üstel hesaplar


%%%%%%%%%%%%%%%%%%%15/10/2026%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATRİS VE VEKTÖR NOTASYONLARI%%%%%%%%%%%%%%%%%%%
A=[3 5 1 -2 7; 4 7 5 6 3; 2 1 7 8 2; 4 1 5 9 3; 3 -2 -1 4 9];
A23=A(2,3); % A(m,n): A'nın m. satır n. sütun elemanını alır
A3S=A(3,:);%A(m,:): A'nın m. satırdaki tüm elemanlarını alır
A2S=A(:,2);% A(:,n) A'nın n. sütundaki  tüm elemenanları
AK=A(:,2:4);%A(:,m:n) A'nın m. sütundan n. sütuna kadar tüm elemanlarını tüm satırlarla alır
rA=rank(A);% A'nın rankını hesaplar 
sA=size(A);%A'nın boyutunu hesaplar 
%%%%%POLİNOMLAR %%%%%%%%%%%%%%%%%%
%P(x)=a_nx^n+a_(n-1)x^(n-1)+...+a_1x+a_0 şeklindeki bir polinom 
%p=[a_n  a_(n-1)  a_(n-2)... a_1 a_0] şşeklinde tanımlanır
p=[8 0 4 -2 0 1 0 10];%p(x)=8x^7+0x^6+4x^5-2x^4+0x^3+1x^2+0x+10
kp=polyval(p,3);% p(x) polinomunun 3 noktasındaki değerini hesaplak kp=p(3)
kl=polyval(p,[-1 2 5 0]);%p(x) in değerini kl=[p(-1) p(2) p(5) p(0)] olacak şekilde hesaplar
q=[1 0 0]; %q(x)=x^2
v=1:1:6;
kq=polyval(q,v);

%Polinom kökü bulalım roots(p):p(x)'in köklerini bulur 
pq=[1 0 -4];%pq(x)=x^2
roots(pq); %roots(pq)   pq(x)=0'ın köklerini bulur 
wq=[5 3 2 1];%wq=5x^3+3x^2+2x+1
rwq=roots(wq);
%poly(roots): kökleri bilinen bir polinomu yazar 
roots1=[-2 2];
p1=poly(roots1);
roots2=[2 2];
p2=poly(roots2);
roots3=[1 2 3 0 5];
p3=poly(roots3);
%conv(p,q): p ve q polinomlarını çarpar 
p4=[4 -4 0 5];%p4(x)=4x^3-4x^2+5
p5=[1 2 3];%p5(x)=x^2+2x+3
pp=conv(p4,p5);%p4 ve p5 i çarptık 
%[bolum,kalan]=deconv(f1,f2) f1/f2'yi hesaplar bolum bölüm sonucunu verir,
%kalan kalanı gösterir 
f1=[5 3 2 1];%f1=5x^3+3x^2+2x+1
f2=[1 2 1];% f2=x^2+2x+1
[bolum,kalan]=deconv(f1,f2);
%polyder(p): polinomun türevini alır
polyder(f1)

%polinom çizimi 
p=[1 1 1 0];%p=x^3+x^2+x+0
u=-2:0.5:2;
pu=polyval(p,u);
%figure(1)
%plot(u,pu,'r');% plot(u,pu): x eksenine u ları, y eksenine pu ları yerleştirir
x=0:pi/100:2*pi;
y=sin(x);
%plot(x,y);

x = 0:pi/10:2*pi;
y1 = sin(x);
y2 = sin(x-0.25);
y3 = sin(x-0.5);

%figure(3)
%plot(x,y1,'g',x,y2,'b--o',x,y3,'c*')
%sembolik çizim 
%ezplot('x^2+x^3',[0 9 -1 500])
%ezplot('x^2+x',[-pi pi])
%xx=-pi:pi/10:pi;
%yy=sin(xx)
%hold on % grafikleri üst üste çizer 
%plot(xx,yy,'r')
%title('Çizim')
%xlabel('x degerleri')
%ylabel('fonksiyon degerleri')
%legend('x^2+x','sin(x)')

figure(5)
x=0:0.5:2*pi;
y1=sin(x);
y2=cos(x);
y3=x;
y4=x.^3;
subplot(2,2,1)
plot(x,y1)
title('y=sin(x)')
subplot(2,2,2)
plot(x,y2)
title('y=cos(x)')
subplot(2,2,3)
plot(x,y3)
title('y=x')
subplot(2,2,4)
plot(x,y4)
title('y=x^3')

%figure(4)
%plot(x,y1,'r',x,y2,'m',x,y3,'g')
%title('Fonksiyonlar')
%xlabel('x')
%ylabel('y')
%legend('sin(x)','cos(x)','x^3')







