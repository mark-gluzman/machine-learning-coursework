function error=divergence(X, W, H)
    [n,m]=size(X);
    err=0.000000000000001;
    error=0;
    Help=err*ones(n,m)+W*H;
    for i=1:n
        for j=1:m
            error=error-X(i,j)*log(Help(i,j))+Help(i,j);
        end;
    end;
    
    
