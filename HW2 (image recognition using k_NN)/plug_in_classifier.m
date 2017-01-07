function f = plug_in_classifier(x,mean_y, cov_y)

f=((det(cov_y)^(-1/2))*exp((-1/2)*(x-mean_y)'*cov_y^(-1)*(x-mean_y)))/(2*pi)^10;