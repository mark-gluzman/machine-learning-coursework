function W=coef_w(X, y)

[N_features,N_samples] = size(X);

n_1=0;
n_minus1=0;

for i_samples=1:N_samples
    if (y(i_samples)==1)
        n_1=n_1+1;
    else
        n_minus1=n_minus1+1;
    end;
end;

X_1=zeros(N_features, n_1);
X_m1=zeros(N_features,n_minus1);

y1=1;
ym1=1;

 for i_samples=1:N_samples
    if (y(i_samples)==1)
        X_1(:,y1)=X(:,i_samples);
        y1=y1+1;
    else
        X_m1(:,ym1)=X(:,i_samples);
        ym1=ym1+1;
    end;
end;       


mean_1=mean(X_1');
mean_m1=mean(X_m1');
covar=cov(X');

w0=log(n_1/n_minus1)-(1.0/2.0)*(mean_1+mean_m1)*(covar)^(-1)*(mean_1-mean_m1)';

w=(covar)\(mean_1-mean_m1)';

W=[w0,w'];