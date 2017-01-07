filename = 'CFB2015.mat';
m = matfile(filename);

scores=m.scores;
legend=m.legend;

[N_team,a] =size(legend);
[N_scores,a]=size(scores);
M=zeros(N_team, N_team);

%form the M matrix
for i=1:N_scores
        if (scores(i,2)>scores(i,4))
            M(scores(i,1), scores(i,1))=M(scores(i,1), scores(i,1))+1+(scores(i,2))/(scores(i,2)+scores(i,4));
            M(scores(i,3),scores(i,3))=M(scores(i,3),scores(i,3))+(scores(i,4))/(scores(i,2)+scores(i,4));
            M(scores(i,1), scores(i,3))=M(scores(i,1), scores(i,3))+(scores(i,4))/(scores(i,2)+scores(i,4));
            M(scores(i,3),scores(i,1))=M(scores(i,3),scores(i,1))+1+(scores(i,2))/(scores(i,2)+scores(i,4));
        else
            M(scores(i,1), scores(i,1))=M(scores(i,1), scores(i,1))+(scores(i,2))/(scores(i,2)+scores(i,4));
            M(scores(i,3),scores(i,3))=M(scores(i,3),scores(i,3))+1+(scores(i,4))/(scores(i,2)+scores(i,4));
            M(scores(i,1), scores(i,3))=M(scores(i,1), scores(i,3))+1+(scores(i,4))/(scores(i,2)+scores(i,4));
            M(scores(i,3),scores(i,1))=M(scores(i,3),scores(i,1))+(scores(i,2))/(scores(i,2)+scores(i,4));
        end;
end;

%normalization
for i=1:N_team
    M(i, :)=M(i, :)/sum(M(i,:));    
end;
%max time + 0
T=2501;
%initialization 
w=zeros(T, N_team);
w(1, :)=rand(N_team,1);
w(1,:)=w(1,:)/sum(w(1,:));
%calculation
for i=2:T
    w(i,:)=w(i-1, :)*M;
end;

[B,I] = sort(w(T,:)','descend');

[w_inf,D]=eigs(M',1)

differ=zeros(T, 1);

for i=1:T
    differ(i,1)=norm((w(i,:)/sum(w(i,:)))'-w_inf/sum(w_inf),1);
end;

figure
plot(differ)

val=differ(T)