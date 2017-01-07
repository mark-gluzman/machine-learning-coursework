function Y = sigma_matrix(X_train, W)

K=10;

[N_pixels,N] = size(X_train);
Y=zeros(N, K);

for j=1:10
    for n=1:N
        x_n=X_train(:,n);
        sigma=differentiation(x_n, W, j);
        Y(n,j)=sigma;
    end
end