filename = 'data.mat';
m = matfile(filename);

X_mat= m.X;
y_mat=m.y;


N=392;
T=20;
K=1000;
P=4;

y_histogram=zeros(T*K, P);
MAE_array=zeros(K,1);
RMSE_array=zeros(K,P);

for p=1:K
N_array=my_random(N, T);
X_train=zeros(N-T, 7);
X_test=zeros(T, 7);
y_train=zeros(N-T, 1);
y_test=zeros(T, 1);

k=0;
for i=1:N
   if ismember(i, N_array)==0
      X_train(i-k,:)=X_mat(i,:);
      y_train(i-k)=y_mat(i);
   else 
      k=k+1;
      X_test(k,:)=X_mat(i,:);
      y_test(k)=y_mat(i);
   end
end

w=LS_W(X_train, y_train);

y_predict=X_test*w;
MAE_array(p)=MAE(y_test,y_predict);
end
MAE_mean=mean(MAE_array)
MAE_std=std(MAE_array)

for p=1:P
for k=1:K
N_array=my_random(N, T);
X_train=zeros(N-T, 7);
X_test=zeros(T, 7);
y_train=zeros(N-T, 1);
y_test=zeros(T, 1);

z=0;
for i=1:N
   if ismember(i, N_array)==0
      X_train(i-z,:)=X_mat(i,:);
      y_train(i-z)=y_mat(i);
   else 
      z=z+1;
      X_test(z,:)=X_mat(i,:);
      y_test(z)=y_mat(i);
   end
end

X_test_extend=polyn(p,X_test);
X_train_extend=polyn(p,X_train);
w_extended=LS_W(X_train_extend, y_train);

y_predict_extended=X_test_extend*w_extended;
RMSE_array(k,p)=RMSE(y_test,y_predict_extended);
for p1=1:T
    y_histogram((k-1)*T+p1, p)=-y_predict_extended(p1)+y_test(p1);
end
end
p;
RMSE_mean=mean(RMSE_array(:,p))
RMSE_std=std(RMSE_array(:,p))
end






figure
subplot(2,2,1)
histogram(y_histogram(:,1))
title('p=1')

subplot(2,2,2)
histogram(y_histogram(:,2))
title('p=2')

subplot(2,2,3)
histogram(y_histogram(:,3))
title('p=3')

subplot(2,2,4)
histogram(y_histogram(:,4))
title('p=4')

Error_mean_1=mean(y_histogram(:,1))
Error_std_1=std(y_histogram(:,1))


Log_sum_1=0;
for i=1:T*N
    Log_sum_1=Log_sum_1+log((1.0/sqrt(2.0*pi*Error_std_1^2.0))*exp(-(y_histogram(i,1)-Error_mean_1)^2/(2.0*Error_std_1^2)));
end
Log_sum_1


Error_mean_2=mean(y_histogram(:,2))
Error_std_2=std(y_histogram(:,2))

Log_sum_2=0;
for i=1:T*N
    Log_sum_2=Log_sum_2+log((1.0/sqrt(2.0*pi*Error_std_2^2.0))*exp(-(y_histogram(i,2)-Error_mean_2)^2/(2.0*Error_std_2^2)));
end
Log_sum_2

Error_mean_3=mean(y_histogram(:,3))
Error_std_3=std(y_histogram(:,3))

Log_sum_3=0;
for i=1:T*N
    Log_sum_3=Log_sum_3+log((1.0/sqrt(2.0*pi*Error_std_3^2.0))*exp(-(y_histogram(i,3)-Error_mean_3)^2/(2.0*Error_std_3^2)));
end
Log_sum_3


Error_mean_4=mean(y_histogram(:,4))
Error_std_4=std(y_histogram(:,4))

Log_sum_4=0;
for i=1:T*N
    Log_sum_4=Log_sum_4+log((1.0/sqrt(2.0*pi*Error_std_4^2.0))*exp(-(y_histogram(i,4)-Error_mean_4)^2/(2.0*Error_std_4^2)));
end
Log_sum_4

figure
plot([1,2,3,4],[Log_sum_1,Log_sum_2,Log_sum_3,Log_sum_4])
