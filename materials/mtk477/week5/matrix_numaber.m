function matrix_numaber(A)
for i=1:length(A)
    if A(i)<0 %A(i)<0 olduğunda tüm for looptan çıkar 
        break 
    end 
    fprintf('Lutfen sayısı yazınız %d \n ',A(i))
end 
