function [label_predict,f_prob] = max_plug_in_classifier(X_test,mean_y, cov_y)
[N_pixels,N_test] = size(X_test);
label_predict=zeros(N_test,1);
N_digits=10;
f_prob=zeros(N_test, N_digits);
for i_sample=1:N_test
    i_best=0;
    f_max=0;
    for i_digit=1:N_digits
        f_prob(i_sample, i_digit)=plug_in_classifier(X_test(:,i_sample),mean_y(:,i_digit), cov_y(:,:,i_digit));
        if f_prob(i_sample, i_digit)>f_max
            i_best=i_digit;
            f_max=f_prob(i_sample, i_digit);
        end
    end
    label_predict(i_sample)=i_best-1;
    
end