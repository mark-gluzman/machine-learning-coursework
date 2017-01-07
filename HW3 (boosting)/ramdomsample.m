function y = ramdomsample(n, w)

y=zeros(n,1);
for i=1:n

    y(i)=cdf(w);
end