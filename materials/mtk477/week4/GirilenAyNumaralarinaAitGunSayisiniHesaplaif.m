function GirilenAyNumaralarinaAitGunSayisiniHesaplaif
ayNo=input('(1-12) Aralığında Bir Ay Numarası Giriniz: ');
if (ayNo==1 || ayNo==3 ||  ayNo==5|| ayNo==7|| ayNo==8|| ayNo==10|| ayNo==12)
    disp('Bu ay 31 Gunden Oluşur.')
    elseif (ayNo==4 || ayNo==6 ||  ayNo==9|| ayNo==11)
     disp('Bu ay 30 Gunden Oluşur.')
    elseif(ayNo==2)
        disp('Bu ay 28 Gunden Oluşur.')
    else
        disp('Dikkat yanlış girdiniz !!')
end


