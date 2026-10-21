function soru7
%Kullanicidan 10 dan kucuk  bir a sayisi girmesini isteyen, verilen sayiyi
%birer artirarak degeri 20 den kucuk, 15 den buyuk oldugu surece ekrana
%yazd?ran program? yazdiriniz. Programin ciktisini elde ediniz. 
%Cikti
%9
%10
%11
%12
%13
%14
%15
a=input('10 den kucuk  bir say? giriniz')
while (a < 20 )
   fprintf('%d\n', a);
   a = a + 1;
      if( a > 15)
         % terminate the loop using break statement 
         break;
      end 
end