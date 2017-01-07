function sum = log_likel(X_train, label_train, W)
sum=0;


K=10;

[N_pixels,N] = size(X_train);

for n=1:N
x_n=X_train(:,n);   
    for k=1:K
         sum_help=0;
         for j=1:K             
             sum_help=sum_help+exp(x_n'*W(:,j));
         end
         sum=sum+(label_train(n)==k-1)*(x_n'*W(:,k)-log(sum_help));
    end
end
             