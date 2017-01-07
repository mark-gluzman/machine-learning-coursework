filename = 'faces.mat';
m = matfile(filename);

X=m.X;
[n,m]=size(X);
K=25;
%initialization W, H
W=rand(n, K);
H=rand(K, m);
% #iterations
T=200;

error=zeros(T,1);

for iter=1:T

    Hel1=W'*X;
    Hel2=W'*W*H;

    for i=1:K
        for j=1:m
            H(i,j)=H(i,j)*Hel1(i,j)/Hel2(i,j);
        end;
    end;


    Hel1=X*H';
    Hel2=W*H*H';

    for i=1:n
        for j=1:K
            W(i,j)=W(i,j)*Hel1(i,j)/Hel2(i,j);
        end;
    end;

    error(iter)=norm(X-W*H)^2;
    
    
end;


figure
plot(error)





[b,idx]=sort(H(1,:));


for image=1:10
    figure
    ax1 = subplot(1,2,1);
    imagesc(reshape(W(:,image),32,32));
    [b,idx]=sort(H(image,:));
    ax2 = subplot(1,2,2);
    imagesc(reshape(X(:,idx(m)),32,32));
    colormap(gray);
end;