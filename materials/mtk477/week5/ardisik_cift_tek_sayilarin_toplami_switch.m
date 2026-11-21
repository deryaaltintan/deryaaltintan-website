function [toplam_cift,toplam_tek]=ardisik_cift_tek_sayilarin_toplami_switch(alt_limit,ust_limit)
toplam_cift=0;
toplam_tek=0;
for j=alt_limit:ust_limit
    tek_cift=mod(j,2);
    switch tek_cift
        case 0
              toplam_cift=toplam_cift+j;
        otherwise 
            toplam_tek=toplam_tek+j;
    end 
end 

toplam_cift
toplam_tek