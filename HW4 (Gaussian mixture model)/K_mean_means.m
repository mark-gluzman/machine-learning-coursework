function [means, C_label] = K_mean_means(X, K)
%number of samples
N = length(X(:,1));
%Label initialization
C_label = zeros(N,1);
%means and covariances random initialization
means = zeros(2,K);

%random initialization
for k=1:K
    means(:,k) = X(randi(N),:);
end;

%likelihood initialization
num_iter=20;
L_sum=zeros(num_iter,1);

for iter=1:num_iter
nk=zeros(K,1);  
    
    
    

for i=1:N
    min_value=1000;
    min_index=1;
    for k=1:K
        min_new=power(norm(X(i,:) - means(:,k)'),2.0);
        if (min_new<min_value) 
            min_value=min_new;
            min_index=k;
        end;
    end;
    C_label(i)=min_index;
end;




    %likelihood calculation
    L_sum(iter)=L_sum_calculation(X, means, K, C_label);
  
    for k=1:K
        for i=1:N
            if (C_label(i)==k)
                nk(k)=nk(k) + 1;
            end;
        end;

        %means calculation
        sum_help=zeros(1,2);
        for i=1:N
            if (C_label(i)==k)
                sum_help = sum_help + X(i,:);
            end;
        end;
        means(:,k)=sum_help/nk(k);
        
     end;
     



end;