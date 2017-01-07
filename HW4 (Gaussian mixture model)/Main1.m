%number of samples
N=500;
%weight
w=[0.2,0.5,0.3];
%generation the cluster assignments
c=ramdomsample(N,w);
%samples initialization
X=zeros(N,2);
%distributions parametrs
m1=[0,0]';
cov1=[1 0; 0 1];

m2=[3,0]';
cov2=[1 0; 0 1];

m3=[0,3]';
cov3=[1 0; 0 1];
%generation the samples
label_real=zeros(N,1);
for i=1:N
    switch c(i)
        case 1
            X(i,:)=mvnrnd(m1,cov1);
            label_real(i)=1;
        case 2
            X(i,:)=mvnrnd(m2,cov2);
            label_real(i)=2;
        case 3
            X(i,:)=mvnrnd(m3,cov3);
            label_real(i)=3;
    end;
end;

%figure
%plot(X(:,1),X(:,2),'*');

%number of clasters
K=5;

[L_sum, C_label] = K_mean(X, K);

figure 
plot (L_sum,'-o');

figure 
for i=1:N
    switch C_label(i)
        case 1
            scatter(X(i,1),X(i,2), 'm')
            hold on
        case 2
            scatter(X(i,1),X(i,2), 'b')
            hold on
        case 3
            scatter(X(i,1),X(i,2), 'r')
            hold on
        case 4
            scatter(X(i,1),X(i,2), 'y')
            hold on
        case 5
            scatter(X(i,1),X(i,2), 'g')
            hold on
    end;
    
    

end;