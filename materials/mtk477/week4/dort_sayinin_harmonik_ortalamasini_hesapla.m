function harmonik_ortalama=dort_sayinin_harmonik_ortalamasini_hesapla(sayi1,sayi2,sayi3,sayi4)
% Harmonik ortalama=4/(1/sayi1)+(1/sayi2)+(1/sayi3)+(1/sayi4)
harmonik_ortalama=4/((1/sayi1)+1/(sayi2)+1/(sayi3)+1/(sayi4));
fprintf('Girilen 4 sayinin harmonik ortalaması: %1.3f \n',harmonik_ortalama)
fprintf('Girilen sayilar %d %d %d %d şeklindedir ve harmonik ortalama %1.3f',sayi1,sayi2,sayi3,sayi4,harmonik_ortalama)