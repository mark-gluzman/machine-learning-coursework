function label = label_prediction(M)

[N_test, K]=size(M);
label=zeros(N_test, 1);

for i=1:N_test

    max=M(i,1);
    k_max=1;
    for k=2:K
        if M(i, k)>max
            max=M(i,k);
            k_max=k;
        end
        label(i)=k_max-1;
    end
        
end