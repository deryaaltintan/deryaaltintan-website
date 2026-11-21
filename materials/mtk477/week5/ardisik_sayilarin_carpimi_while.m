function  [cift_carpim,tek_carpim]=ardisik_sayilarin_carpimi_while(alt_limit,ust_limit)
tek_carpim=1;
cift_carpim=1;
j=alt_limit;
while  j<=ust_limit
    if mod(j,2)==0
        cift_carpim=cift_carpim*j;
    else 
      tek_carpim=tek_carpim*j;
    end
    j=j+1;
end 
cift_carpim
tek_carpim