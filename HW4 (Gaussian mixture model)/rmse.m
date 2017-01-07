function [N_vector, y] = rmse(M_test, M_new)

[N,a]=size(M_test(:,1));
N_vector=zeros(N,1);
for i=1:N
    N_vector(i)=M_new(M_test(i,1), M_test(i,2));
end;

y = sqrt(mean((N_vector - M_test(:,3)).^2)); 
