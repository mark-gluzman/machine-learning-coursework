function sum_claster = L_sum_calculation(X, means, K, c)
%Calculation of objective function
sum_claster=0;

for i=1:length(X(:,1))
    for k=1:K
        if (c(i)==k)
           sum_claster = sum_claster + power(norm(X(i,:) - means(:,k)'),2.0);
        end;
    end;
end;