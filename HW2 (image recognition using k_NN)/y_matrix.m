function Y = y_matrix(y_vector)

K=10;
[o, N]=size(y_vector);
Y=zeros(N, K);

for i=1:N
    k=y_vector(i);
    Y(i,k+1)=1;
end