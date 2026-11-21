%%%%%%%%%%%%%%%%%HAFTA 3%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%MANTIKSAL OPERATÖRLER%%%%%%%%%%%%%%%%%%%
clear all;clc
% == Eşit mi 
% ~= Eşit değil mi 
% > büyük, < küçük 
% >=  Büyük eşit mi, <= küçük eşit mi 
% Sorulan soru doğru cevaplanırsa cevap 1, yanlış cevaplanırsa 0 verilir 
a=(5==6);
b=(5<=6);
c=(9~=-9);
d=(8<7);
% && VE; || VEYA ; ~ DEĞİL
% A=0 B=0 A&&B=0; A=0 B=1 A&&B=0;  A=1 B=0 A&&B=0; A=1 B=1 A&&B=1
% A=0 B=0 A||B=0; A=0 B=1 A||B=1;  A=1 B=0 A||B=1; A=1 B=1 A||B=1
% A=0 ~A=1; A=1 ~A=0
K=(6>9) && (7<0);
L=(6>9) && (-7<0);
M=(6>9) || (-7<0);
U=(4~=5)&&(9<=-10);

% SEMBOLİK DEĞİŞKENLER
x=sym('x'); % x i sembolik olarak tanımlar 
syms x ; % x'i sembolik tanımlar 
syms a b c d; % sembolik a b c d tanımladı 
f=a*x^2+b*x+c;
y=x+1.4*sqrt(x+3)+5.49;
pretty(y);% verilen y'yi matematiksel formda yazar 
z=x^3-3*x^2+sin(x);
pretty(z);
% factor(g): g yi çarpanlarına ayırır 
% factor(sayi): sayıyı çarpanlarına ayırır 
%expand(g): g yi açar 
%subs(f,x,a): f deki x yerine a değerini koyar 
%simplify(g): g yi en kolay biçimde yazar 
%pretty(g): g yi matematiksel yazar
%collect(g,x): g yi xin polinomu gibi yazar 
%combine(g): g deki benzer terimleri birleştirir 

% factor 
syms z; 
syms y;
f=z^3+3*z^2+3*z+1;
g=x^2-x-2;
factor(f);
factor(g);
factor(10);
g1=x^2-2*x*z+z^2;
factor(g1);
g2=x^4-y^3;
factor(g2);
g3=x^2-4+x^3-8;
factor(g3);
g4=((x^2+1)*(x^3+x-2))/((x^2+x+2)*(x^4-1));
pretty(g4);
B=factor(g4);

%expand 
syms x y z 
uv=cos(x+y);
expand(uv);
uv2=sin(x-y+z);
expand(uv2);
uv3=(x^2-y^2)*(x+1)*(3-y);
expand(uv3);
factor(uv3);
uv4=sin(3*x+y)*cos(2*x-2*y);
expand(uv4);
uv5=(x+y)^4;
expand(uv5);

%subs 
f=3*x^2-7*x+5;
f1=subs(f,3);
m=cos(2*x)*exp(2*y)+sin(x+y)*log(x)-x^2*y^3;
U=subs(subs(f,y,0),x,pi);% f deki y nin yerine 0, sonra x in yerine pi koyar 
U=double(U); % U yu sayısal verir 
 syms  a b c v
 g=a*sin(v)+b*v^3-5*c;
 kg=subs(g,[a b c v],[1 2 3 10]);
 kt=subs(g,a,4);

 %simplify, pretty

k=sym('k');
VV=8-5*sin(k)^2-5*cos(k)^2;
pretty(VV);
simplify(VV);
VV2=str2sym('(x^3-8)*(x^2+7*x)/((2*x^2+4*x+8)*(x^3-2*x))');
pretty(VV2);
K1=simplify(VV2);
K2=simplifyFraction(VV2);

%collect 
syms u
g=(exp(u)+sin(u))*(u^2+5*u+7);
pretty(g);
simplify(g);
collect(g);%u degişkenine göre polinom yazar 
syms a b c d e f x; 
F=a*sin(2*x)+b*sin(2*x)+c*cos(x)+d*cos(x)+e*sin(3*x)+f*sin(3*x);
collect(F,'sin');% collect(f,'P') f fonksiyonunun katsayılarını P cinsinden yazar 
collect(F,'cos');
collect(F,{'sin','cos'});


%combine
kv=x^3+sin(z)*y+exp(y)+cos(z)*exp(y)+sin(z)*y+77*z+cos(z)*x^2-5*x;
combine(kv)

mk=exp(x)*exp(y);
%mk1=(exp(x))^y
%combine(mk)
%combine(mk1)
combine(mk,'exp');
mk2=log(x)+log(y);
combine(mk2,'log');
combine(mk2,'log','IgnoreAnalyticConstraints',true);%'IgnoreAnalyticConstraints',true ifadesi 
%cebirsel eşitlikleri kullanır. Basit cebirsel eşitlikleri kullanır fakat bu eşitliklerin tüm değişkenler için 
% olup olmadığını kontrol etmez
mk3=log(x)-log(y);
combine(mk3,'log');
combine(mk3,'log','IgnoreAnalyticConstraints',true);
%%%%%%%%%%%%%%%%22/10/2026%%%%%%%%%%%%%
%sym komutu sayıları en sade şekilleriyle de yazar 
sym(120/20);
sym((2025^3*2026)/403208);


%INTEGRAL
%int(f): f in integralini alır. Birden çok değişken varsa matlab kendi
%sırası olan t, x, y, z,..... sırasıını kullanır
%int(f,x): f in x e göre integralini alır 
syms n 
y=sin(x);
k=int(y,x);
kl=int(y,0,pi);
z=x^n;
kz=int(z,x);
m=cos(2*x)*sin(2*x);
km=int(m);
%int(f,a,b): [a,b] aralıkta integral alır
%int(f,x,a,b): f in x e göre integralini [a,b] aralığında alır 
syms x a b 
int(x^4+2*x-1,a,b);
int(sin(2*x)+cos(x),pi/2,pi);

%çift katlı integral 
%int(int(f,x,c,d),y,a,b): önce içteki int(f,x,c,d) integralini alır. 
%daha sonra elde edilen tek değişkenli fonksiyonunun integralini alır 
syms y 
f=y*sin(x)+x*cos(y);
fk=int(int(f,x,0,pi),y,pi,2*pi);


% TÜREV
%diff(f): f nin türevini alır 
%diff(f,n): f nin n. türevini alır
syms c d 
f=a*x^3+b*x^2+c*x+d;
diff(f,x);
diff(f,a);
diff(f,b);
diff(f,3);
g=a^5*x^10+b^4*x^4;
diff(g,a,3);

diff(sin(x)*cos(y)+x^2*exp(y),y,x);

syms t 
F=(6*t-9)/(2*t^2+4*t-6);
pretty(F)
K10=diff(F,t);
simplify(K10);

%LİMİT 
%limit(f,a): f nin a daki limitini elde eder 
syms h real 
K=limit((x-3)/(x^2-9),3);
KL=limit(1/(x-5),5);
KM=limit(sin(x)/x,0);
KT=limit(x^3+5*x^2-89,1.75);
double(KT)
K1=limit(cos(x+h)-cos(x)/h,h,0);
K2=limit(x/abs(x),x,0,'left');%soldan limit alır
K3=limit(x/abs(x),x,0,'right');%sağdan limit alır
K4=limit(x/abs(x),x,0);% limit olmadığı için not a number verecek 


%DENKLEM ÇÖZÜMLERİ 
u=3*x^2+5*x-7;
solve(u);
p=a*x^2+b*x+c;
pp=[a b c];
solve(p);
roots(pp);
kp=[3 -5 7];
roots(kp);

solve(x^5-16*x);
[cozum_x,cozum_y]=solve([3*x-y==2,x-y==0],[x,y]);
S=solve([3*x-6*y==4,x+y==5],[x,y]);
S.x;
S.y;

K=solve([sin(x)^2==cos(y),2*x==y],[x,y]);
K.x;
K.y;


S = solve(x^2 - 25 > 0, x, 'ReturnConditions', true);
[solx, params, conds]=solve(x^2 - 25 > 0, x, 'ReturnConditions', true);


TK=solve(x^2>7*x,x,'ReturnConditions',true)
TK.conditions


SLR=solve([x^2+y^2+x*y<1,x>0,y>0],[x,y])
SLR.x
SLR.y

SL=solve([x^2+y^2+x*y<1,x>0,y>0],[x,y],'ReturnConditions',true)
SL.x
SL.y
SL.parameters
SL.conditions

SM=solve([x^2+y^2+2*x*y<1,x>0,y>0],[x,y],'ReturnConditions',true)
SM.x
SM.y
SM.parameters
SM.conditions



