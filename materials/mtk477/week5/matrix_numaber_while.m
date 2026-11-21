function matrix_numaber_while(A)
i=1;
while i<=length(A)
    if A(i)<0
        break 
    end 
    fprintf('Lutfen sayısı yazınız %d \n ',A(i))
    i=i+1;
end 