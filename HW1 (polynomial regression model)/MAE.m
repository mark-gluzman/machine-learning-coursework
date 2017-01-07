function er = MAE(A, B)
er=0;
    for i=1:length(A)
        er=er+abs(A(i)-B(i));
    end
er=er/length(A);
end