function soru11(yil)
%Subatin 29 gun cektigi dolayisiyla bu y?llar 365 yerine 366 gun ceker 
%Artik yil 3 farkli sekilde hesaplanir. 
%Verilen bir yil icin yil eger 4 e
%bolunuyor fakat 100 e bolunmuyorsa artik yildir, 400  e bolunuyorsa artik
%yildir. Bu bilgilari kullanarak verilen bir yilin artik y?l olup olmad?gini belirleyen programi yaz?n?z. 
%Kullaniciya yilin artik olup olmad?gini yaziniz. 1980 ve 2024 artik midir ? Degil midir ? ?nceleyiniz.
%Cevap=1975 artik degil,2024 artik yil.
if (mod(yil, 400) == 0)   
fprintf('%d artik yil \n', yil) 
elseif (mod(yil,4) == 0) && (mod(yil,100) ~= 0)    
    fprintf('%d artik yil \n', yil) 
else
    fprintf('%d artik yil degil \n', yil)
end