function e=err(pred, real)

sum=0;

for i=1:length(pred)
    if(pred(i)==real(i))
        sum=sum+1;
    end;
end;

e=1-sum/length(pred);
