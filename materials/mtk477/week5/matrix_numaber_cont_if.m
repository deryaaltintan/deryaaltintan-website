function matrix_numaber_cont_if(A)
for i=1:length(A)
    if A(i)<0 
        continue %A(i)<0 olduğunda SADECE o basamağı atlar fora devam eder
    end 
    fprintf('Lutfen sayısı yazınız %d \n ',A(i))
end 

A=[1 23 25 -100 67 -3 ];