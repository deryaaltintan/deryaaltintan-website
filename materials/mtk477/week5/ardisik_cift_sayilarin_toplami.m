function toplam=ardisik_cift_sayilarin_toplami(alt_limit,ust_limit)
toplam=0;
for j=alt_limit:ust_limit
    if mod(j,2)==0
        j
        toplam=toplam+j
    end 
end 