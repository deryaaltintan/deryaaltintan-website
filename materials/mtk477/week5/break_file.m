function break_file
i=1
while i<=10
    if i==5
        break %cut while or for loop 
    end 
    fprintf('Sayıyı yaz %d \n',i)
    i=i+1
end 