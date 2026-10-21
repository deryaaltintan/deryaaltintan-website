function A=soru4(A)
%Verilen R xC boyutlu herhangi bir matris A matrisi i?in A(i,j). i=1,2,... ,R,i=1,2,... ,C  bile?eni A(i,j)>0 ise A(i,j)=1; A(i,j)<0 ise A(i,j)=-1
%A(i,j)=0 A(i,j)=0 formuna getiren algoritmay? yaziniz. A=[1 -20 ; 3 4; 0
%98; -56 78] icin cevab? elde ediniz. Cevap:  C=[1 -1; 1 1; 0 1; -1 1]
[R,C]=size(A)
for i=1:R
    for j=1:C
        if A(i,j)>0
            A(i,j)=1;
        elseif A(i,j)<0
            A(i,j)=-1;
        else
            A(i,j)=0;
        end
    end 
end 
            
