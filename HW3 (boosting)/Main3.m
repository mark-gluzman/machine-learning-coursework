filename = 'cancer.mat';
m = matfile(filename);

label=m.label;
X=m.X;
T=1000;
nu=0.1;
at_array=zeros(T,1);
et_array=zeros(T,1);
error_train=zeros(T,1);
error_test=zeros(T,1);

point_1=zeros(T,1);
point_2=zeros(T,1);
point_3=zeros(T,1);


label_test=label(:,1:183);
label_train=label(:,184:683);

X_test=X(:,1:183);
X_train=X(:,184:683);

[N_features, N_tr]=size(X_train);
[N_features, N_ts]=size(X_test);
w=zeros(N_features,1);

pt=ones(N_tr,1)/N_tr;

Bt=zeros(N_features, N_tr);
yt=zeros(N_tr,1);
f_boost_train=zeros(N_tr,1);
sum_boost_train=zeros(N_tr,1);
f_boost_test=zeros(N_ts,1);
sum_boost_test=zeros(N_ts,1);
for t=1:T
    point_2(t)=pt(38);
    point_3(t)=pt(42);
    point_1(t)=pt(27);
    
    T=ramdomsample(N_tr, pt);

    for i=1:N_tr
        Bt(:,i)=X_train(:,T(i));
        yt(i)=label_train(T(i));
    end;
    
for i=1:N_tr
    lambda=1.0/(1+exp(-yt(i)*Bt(:,i)'*w));
    w=w+nu*(1-lambda)*yt(i)*Bt(:,i);
end;

wt=w;

for i=1:N_tr
    if (sign(X_train(:,i)'*wt)~=label_train(i))
        et_array(t)=et_array(t)+pt(i);
    end;
end;

at_array(t)=1.0/2*log((1-et_array(t))/et_array(t));


for i=1:N_tr
    pt(i)=pt(i)*exp(-at_array(t)*label_train(i)*sign(X_train(:,i)'*wt));
end;

sum=0;
for i=1:N_tr
    sum=sum+pt(i);
end;  
pt=pt/sum;



for i=1:N_tr
sum_boost_train(i)=sum_boost_train(i)+at_array(t)*sign(X_train(:,i)'*wt);
f_boost_train(i)=sign(sum_boost_train(i));
end;

for i=1:N_ts
sum_boost_test(i)=sum_boost_test(i)+at_array(t)*sign(X_test(:,i)'*wt);
f_boost_test(i)=sign(sum_boost_test(i));
end;

error_train(t)=err(f_boost_train, label_train);
error_test(t)=err(f_boost_test, label_test);
%f_boost
end;

error_test(1000);
regression(X_train, X_test, label_train, label_test);


figure
plot([error_train, error_test]);
legend('training error','testing error')

figure
plot(at_array);
legend('\alpha_t');
figure
plot(et_array);
legend('\epsilon_t');

figure
plot([point_1,point_2,point_3]);
legend('p_t(27)','p_t(38)','p_t(42)');