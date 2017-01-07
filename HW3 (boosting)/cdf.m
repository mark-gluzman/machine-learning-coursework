function y = cdf(w)

x=rand();
sum=0;
k=1;
while(sum<x)

    sum=sum+w(k);
    k=k+1;
end

y=k-1;
