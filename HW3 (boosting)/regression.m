function er = regression(X_train, X_test, label_train, label_test)

[N_features, N_tr]=size(X_train);
[N_features, N_ts]=size(X_test);

nu=0.1;
T=1000;
w=zeros(N_features,1);

for t=1:T
    sum=0;
    for i=1:N_tr
        lambda=1.0/(1+exp(-label_train(i)*X_train(:,i)'*w));
        sum=sum+(1-lambda)*label_train(i)*X_train(:,i);
    end;
    w=w+nu*sum;
end;

pred=sign(X_test'*w);

er=err(pred,label_test);