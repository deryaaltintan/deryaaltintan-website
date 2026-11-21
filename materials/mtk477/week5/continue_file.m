function continue_file
for i=1:20 
    if mod(i,2)~= 0
        continue
    end 
    fprintf('Sayıyı lütfen yazınız %d \n',i)
end 