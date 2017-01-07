function C = confusion_matrix(label_predict,label_test)
C=zeros(10,10);
for i=1:size(label_predict)
    C(label_test(i)+1, label_predict(i)+1)=C(label_test(i)+1, label_predict(i)+1)+1;
end
