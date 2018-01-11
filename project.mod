param ptr, integer; #numero di elementi nel training set
param pval, integer; #numero di elementi nel validation set
param ptest, integer; #numeri di elementi nel test set
param n, integer; #numero di ingressi
param nl, integer; #numero di neuroni nello strato nascosto

param xtr{1..n, 1..ptr};
param ytr{1..ptr};
param xval{1..n, 1..pval};
param yval{1..pval};

param school{1..n, 1..ptr};
param sex{1..n, 1..ptr};
param age{1..n, 1..ptr};
param address{1..n, 1..ptr};
param famsize{1..n, 1..ptr};
param Pstatus{1..n, 1..ptr};
param Medu{1..n, 1..ptr};
param Fedu{1..n, 1..ptr};
param Mjob{1..n, 1..ptr};
param Fjob{1..n, 1..ptr};
param reason{1..n, 1..ptr};
param guardian{1..n, 1..ptr};
param traveltime{1..n, 1..ptr};
param studytime{1..n, 1..ptr};
param failures{1..n, 1..ptr};
param schoolsup{1..n, 1..ptr};
param famsup{1..n, 1..ptr};
param paid{1..n, 1..ptr};
param activities{1..n, 1..ptr};
param nursery{1..n, 1..ptr};
param higher{1..n, 1..ptr};
param internet{1..n, 1..ptr};
param romantic{1..n, 1..ptr};
param famrel{1..n, 1..ptr};
param freetime{1..n, 1..ptr};
param goout{1..n, 1..ptr};
param Dalc{1..n, 1..ptr};
param Walc{1..n, 1..ptr};
param health{1..n, 1..ptr};
param absences{1..n, 1..ptr};
param G1{1..n, 1..ptr};
param G2{1..n, 1..ptr};
param G3{1..n, 1..ptr};

param gamma;
param rho0;
param rho1;

#var w{1..n+1, 1..ptr};
#var v{1..nl};
var w{1..nl};
var c{1..nl};


#minimize error_tr: (0.5/ptr) * sum{p in 1..ptr} ( sum{k in 1..nl}
#				v[k]*
#				(1 - exp(-(sum{i in 1..n} w[i,k]*xtr[i,p] - w[n+1,k])))/
#				(1 + exp(-(sum{i in 1..n} w[i,k]*xtr[i,p] - w[n+1,k]))) - ytr[p] )^2
#				+ 0.5 * gamma * sum{i in 1..n+1, k in 1..nl} (w[i,k]^2 + v[k]^2);

minimize error_tr_rbf: 0.5 * sum{p in 1..ptr} (sum{i in 1..nl}
				 w[i]*exp(-(sum{k in 1..n}xtr[k,p] - c[i])^2 - ytr[p]))^2
				 + 0.5 * rho0 + sum{i in 1..nl} (w[i]^2)
				 + 0.5 * rho1 + sum{i in 1..nl} (c[i]^2);

minimize error_val_rbf: 0.5 * sum{p in 1..pval} (sum{i in 1..nl}
				 w[i]*exp(-(sum{k in 1..n}xval[k,p] - c[i])^2 - yval[p]))^2;
				