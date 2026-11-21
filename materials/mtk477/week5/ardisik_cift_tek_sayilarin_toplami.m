function [toplam_cift,toplam_tek]=ardisik_cift_tek_sayilarin_toplami(alt_limit,ust_limit)
toplam_cift=0;
toplam_tek=0;
for j=alt_limit:ust_limit
    if mod(j,2)==0
       toplam_cift=toplam_cift+j;
    else
       toplam_tek=toplam_tek+j;
    end 
end 

toplam_cift;
toplam_tek;