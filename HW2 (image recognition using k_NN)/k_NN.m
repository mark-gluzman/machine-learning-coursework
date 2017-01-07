function label_predict_k = k_NN(X_train, label_train, k_N, X_test)

[N_pixels,N_train] = size(X_train);
[N_pixels,N_test] = size(X_test);

label_predict_k=zeros(N_test,k_N);


for i_test=1:N_test
    i_predict_k=zeros(k_N,1);
    for k=1:k_N       
        norm_er_min=100;
        i_best=0;
        for i_train=1:N_train
            norm_er_new=norm(X_train(:,i_train)-X_test(:,i_test));
            if (norm_er_new<norm_er_min) && (ismember(i_train, i_predict_k)==0)
                norm_er_min=norm_er_new;
                i_best=i_train;
            end
        end
        label_predict_k(i_test,k)=label_train(i_best);
        i_predict_k(k)=i_best;
    end
end