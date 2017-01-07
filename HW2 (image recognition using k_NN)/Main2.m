filename = 'mnist_mat.mat';
m = matfile(filename);

X_test= m.Xtest;
X_train=m.Xtrain;
label_train=m.label_train;
label_test=m.label_test;
Q=m.Q;
N_digits=10;
[N_pixels,N_train] = size(X_train);

n_train=N_train/N_digits;
array_of_avarage=zeros(N_pixels, n_train, N_digits);
for i_digit=1:N_digits
    array_of_avarage(:,:,i_digit)=X_train(:,(i_digit-1)*n_train+1:n_train*i_digit);
end
mean_array=zeros(N_pixels, N_digits);

for i_digit=1:N_digits
    mean_array(:,i_digit)=mean(array_of_avarage(:,:,i_digit),2);
end

cov_array=zeros(N_pixels, N_pixels,N_digits);
for i_digit=1:N_digits
    cov_array(:,:,i_digit)=cov(array_of_avarage(:,:,i_digit)');
end

for i_digit=1:N_digits
    figure
    imagesc(reshape(Q*mean_array(:,i_digit),28,28)');
end


[label_predict, f_prob]=max_plug_in_classifier(X_test, mean_array, cov_array);

con_mat=confusion_matrix(label_predict,label_test)
error=trace(con_mat)/500

figure
plot([0,1,2,3,4,5,6,7,8,9],f_prob(130,:));
figure
plot([0,1,2,3,4,5,6,7,8,9],f_prob(180,:));
figure
plot([0,1,2,3,4,5,6,7,8,9],f_prob(422,:));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,130),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,130),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,180),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,180),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,422),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,422),28,28)')
colormap(ax2,gray(2));