function er = RMSE(A, B)
er=0;
    for i=1:length(A)
        er=er+(A(i)-B(i))^2;
    end
er=sqrt(er/length(A));
end