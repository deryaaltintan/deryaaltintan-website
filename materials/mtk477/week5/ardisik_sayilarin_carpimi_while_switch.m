function  [cift_carpim,tek_carpim]=ardisik_sayilarin_carpimi_while_switch(alt_limit,ust_limit)
tek_carpim=1;
cift_carpim=1;
j=alt_limit;
while  j<=ust_limit
    b=mod(j,2);
    switch b
        case 0
        cift_carpim=cift_carpim*j;
        otherwise
      tek_carpim=tek_carpim*j;
    end
    j=j+1;
end 
cift_carpim
tek_carpim