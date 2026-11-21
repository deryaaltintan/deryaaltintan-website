%%%%% if,elseif,else komutu%%%%
%if şart (if=eger)
%    A işlemini yap
%else(else=degilse)
%    B işlemini yap
%end 
% if şart1
%    A1 işlemini yap
%elseif şart2
%     A2 işlemini yap
%elseif şart3
%     A3 işlemini yap
%else 
%     B1 işlemini yap
%end 

function y=if_fonk(x,a)
%y=if_fonk(x,a) fonksiyonu verilen x reel sayısını a sayısı ile
%kıyaslayarak y çıktısını oluşturur 
if (x>a)
    y=x-a;
else 
    y=a-x;
end 