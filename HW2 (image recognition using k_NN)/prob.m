function f = prob(X_test, W, n)
K=10;
f=zeros(K,1);
x_n=X_test(:,n); 
sum_help=0;
for j=1:K             
        sum_help=sum_help+exp(x_n'*W(:,j));
end
for k=1:K  
    f(k)=exp(x_n'*W(:,k))/sum_help;
end