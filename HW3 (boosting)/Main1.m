filename = 'cancer.mat';
m = matfile(filename);

label=m.label;
X=m.X;

w=[0.1,0.2,0.3,0.4];
k=ramdomsample(50,w);
figure
title('50')
histogram(k)

k=ramdomsample(250,w);
figure
title('250')
histogram(k)

k=ramdomsample(500,w);
figure
title('500')
histogram(k)