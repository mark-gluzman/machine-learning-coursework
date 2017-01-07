filename = 'mnist_mat.mat';
m = matfile(filename);

X_test= m.Xtest;
X_train=m.Xtrain;
label_train=m.label_train;
label_test=m.label_test;
Q=m.Q;
N_digits=10;
[N_pixels,N_train] = size(X_train);
[N_pixels,N_test] = size(X_test);

X_train21=[X_train',ones(N_train, 1)]';

X_test21=[X_test',ones(N_test, 1)]';

stepsize=0.1/5000;

Y=y_matrix(label_train);

W=zeros(21,10);

N_iter=1000;
L_w=zeros(N_iter,1);
U=zeros(N_iter,1);




for q=1:100
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=101:200
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=201:300
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=301:400
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=401:500
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=501:600
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=601:700
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=701:800
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=801:900
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
for q=901:1000
    S_matrix=sigma_matrix(X_train21, W);
    X=Y-S_matrix;
    W_err=X_train21*X;
    W=W+stepsize*W_err;
    
    U(q)=q;
    L_w(q)=log_likel(X_train21,label_train, W);
end
F=X_test21'*W;

label_predict=label_prediction(F);
C_M=confusion_matrix(label_predict,label_test);
error=trace(C_M)/500


    
figure
plot(U,L_w);

figure
plot([0,1,2,3,4,5,6,7,8,9],prob(X_test21, W, 130));
figure
plot([0,1,2,3,4,5,6,7,8,9],prob(X_test21, W, 180));
figure
plot([0,1,2,3,4,5,6,7,8,9],prob(X_test21, W, 422));