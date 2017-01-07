function y = polyn(p, X)
    y = ones(length(X), (length(X(1,:))-1)*p+1);

for i=1:length(X)
   for k=0:(p-1)
       for j=1:length(X(1,:))-1
           y(i,1+j+k*(length(X(1,:))-1))=(X(i, j+1))^(k+1);
       end
   end
end