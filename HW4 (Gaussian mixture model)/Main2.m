load('movie_ratings.mat');
%data = matfile(filename);
%Constants
[a, N1]=size(user);
[a, N2]=size(movie);
d=10;
lambda=10;
sigma2=0.25;
N_iter=100;

u=zeros(d,N1);
v=zeros(d,N2);
%Generation of v_j
for j=1:N2
    v(:,j)=mvnrnd(zeros(d,1),eye(d)/lambda);
end;

RMSE_res=zeros(N_iter,1);
likelihood=zeros(N_iter,1);
for iter=1:N_iter
   
    %user locationspause
    

    for i=1:N1
        sum1=zeros(d,d);
        sum2=zeros(d,1);
        for j=user(i).movie_id
            sum1=sum1+v(:,j)*v(:,j)';
        end;
        for j=user(i).movie_id
            k=find(user(i).movie_id==j, 1);
            sum2=sum2+user(i).rating(k)*v(:,j);
        end;
        u(:,i)=(lambda*sigma2*eye(d)+sum1)\sum2;
    end;

    

    %movie locations

    for j=1:N2
        sum1=zeros(d,d);
        sum2=zeros(d,1);
        for i=movie(j).user_id
            sum1=sum1+u(:,i)*u(:,i)';
        end;
        for i=movie(j).user_id         
            k=find(movie(j).user_id==i, 1);
            sum2=sum2+movie(j).rating(k)*u(:,i);
        end;
        v(:,j)=(lambda*sigma2*eye(d)+sum1)\sum2;
    end;
    
    
    
 M_new=zeros(N1, N2);
    for i=1:N1
        for j=1:N2
            M_new(i,j)=round(u(:,i)'*v(:,j));
        end;
    end;
 
    [M_predict, RMSE_res]=rmse(ratings_test, M_new);
    likelihood(iter)=log_joint_like(u, v, N1, N2, lambda, d, sigma2);
end;


   
    
figure 
plot(RMSE_res(2:100));


figure 
plot(likelihood(2:100));

p=257;
norm_array=zeros(N2,1);
for j=1:N2
    norm_array(j)=norm(v(:,j)-v(:,p));
end;

[B,I]=sort(norm_array);


K=20;
[idx,C] = kmeans(u',K);
z=zeros(20,1);
for i=1:N1
     z(idx(i))=z(idx(i))+1;
end;

poiu1=zeros(N2,1);
for j=1:N2
     poiu1=C(5,:)*v(:,j);
end;
[B1,I1]=sort(poiu1);

[idx,C,sumd,D] = kmeans(v',K);
z=zeros(20,1);
for j=1:N2
     z(idx(j))=z(idx(j))+1;
end;

poiu2=zeros(N1,1);
for i=1:N1
     poiu2(i)=norm(C(20,:)-u(:,i));
end;
[B2,I2]=sort(poiu2);