filename = 'mnist_mat.mat';
m = matfile(filename);

X_test= m.Xtest;
X_train=m.Xtrain;
label_train=m.label_train;
label_test=m.label_test;
Q=m.Q;

label_predict1=mode(k_NN(X_train, label_train, 1, X_test), 2);
error1=trace(confusion_matrix(label_predict1, label_test))/500;
label_predict2=mode(k_NN(X_train, label_train, 2, X_test), 2);
error2=trace(confusion_matrix(label_predict2, label_test))/500;
label_predict3=mode(k_NN(X_train, label_train, 3, X_test), 2);
error3=trace(confusion_matrix(label_predict3, label_test))/500;
label_predict4=mode(k_NN(X_train, label_train, 4, X_test), 2);
error4=trace(confusion_matrix(label_predict4, label_test))/500;
label_predict5=mode(k_NN(X_train, label_train, 5, X_test), 2);
error5=trace(confusion_matrix(label_predict5, label_test))/500;


figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,11),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,11),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,20),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,20),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,141),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,141),28,28)')
colormap(ax2,gray(2));



figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,155),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,155),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,165),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,165),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,166),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,166),28,28)')
colormap(ax2,gray(2));





figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,436),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,436),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,448),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,448),28,28)')
colormap(ax2,gray(2));

figure
ax1 = subplot(1,2,1);
imagesc(reshape(Q*X_test(:,456),28,28)')
ax2 = subplot(1,2,2);
imagesc(reshape(Q*X_test(:,456),28,28)')
colormap(ax2,gray(2));


y=k_NN(X_train, label_train, 5, X_test)