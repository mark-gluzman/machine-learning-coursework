function sigma = differentiation(x_n, w, k)

sum=0;

N=10;

for i=1:N
    sum=sum+exp(x_n'*w(:,i));
end

sigma=exp(x_n'*w(:,k))/sum;