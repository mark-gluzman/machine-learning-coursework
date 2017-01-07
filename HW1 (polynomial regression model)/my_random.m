function y = my_random(N,T)
    u=0;
    y=zeros(T,1);
    for i=1:T
        u = random('unid', N, 1, 1);
        while (ismember(u, y)~=0)
            u = random('unid', N, 1, 1);
        end
        y(i)=u;
    end
end
