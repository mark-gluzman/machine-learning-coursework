function y = log_joint_like(u, v, N1, N2, lambda, d, sigma2)
load('movie_ratings.mat');
sum1=0;
sum2=0;
sum3=0;

for i=1:N1
    sum1=sum1+log(mvnpdf(u(:,i),zeros(d,1),eye(d)/lambda));
end;

for j=1:N2
    sum2=sum2+log(mvnpdf(v(:,j),zeros(d,1),eye(d)/lambda));
end;

for i=1:N1
    for j=user(i).movie_id
            k=find(user(i).movie_id==j, 1);
            sum3=sum3+log(normpdf(user(i).rating(k),u(:,i)'*v(:,j),sigma2));
    end;
end;

y=sum1+sum2+sum3;