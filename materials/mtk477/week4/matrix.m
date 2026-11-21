% elemanları [1,k] arasında 
% rastgele sayılar olan m*n'lik bir matris oluşturalım  

function A=matrix(m,n,k)
A=1+(k-1)*rand(m,n);