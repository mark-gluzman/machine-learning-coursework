filename = 'nyt_data.mat';
m = matfile(filename);
Xid=m.Xid;
Xcnt=m.Xcnt;
nyt_vocab=m.nyt_vocab;

[N_words, a]=size(nyt_vocab);
[a, N_documents]=size(Xid);
err=0.000000000000001;
%constract X
X=zeros(N_words, N_documents);

for doc=1:N_documents
        Doc1=cell2mat(Xid(doc));
        Doc2=cell2mat(Xcnt(doc));
        for word=1:length(Doc1)
            X(Doc1(word), doc)=Doc2(word);
        end;
end;




[n,m]=size(X);
K=25;
%initialization W, H
W=rand(n, K);
H=rand(K, m);
% #iterations
T=200;

error=zeros(T,1);
error2=zeros(T,1);
Pink=zeros(n,K);
Blue=zeros(K, m);


for iter=1:T
   %calculate H
   Help=err*ones(n,m)+W*H;
   Purple=X./(Help);
 
   
   for i=1:K
       Pink(:,i)=W(:,i)/(sum(W(:,i))+err);
   end;


   H=H.*(Pink'*Purple);
    
   %calculate W
   Help=err*ones(n,m)+W*H;
   Purple=X./(Help);
   
   for i=1:K
       Blue(i,:)=H(i,:)/(sum(H(i,:))+err);
   end;
   
   W=W.*(Purple*Blue');
   
   %error 
   error(iter)=divergence(X, W, H);
    
end;
figure
plot(error);

col=1;
[b,idx]=sort(Pink(:,col),'descend');
words=cell(10,1);

for i=1:10
   words{i} = cell2mat(nyt_vocab(idx(i)));
end;


