param ptr, integer;   #numero di elementi nel training set
param pval, integer;  #numero di elementi nel validation set
param ptest, integer; #numeri di elementi nel test set
param n, integer;	  #numero di features + y
param nl, integer; 	  #numero di neuroni nello strato nascosto

param xtr{1..n-1, 1..ptr};
#param xtr2{1..3, 1..ptr};
param ytr{1..ptr};

param xval{1..n-1, 1..pval};
#param xval2{1..3, 1..ptr};
param yval{1..pval};

#param xtest{1..n-1, 1..ptest};
#param xtest2{1..3, 1..ptest};
#param ytest{1..ptest};

param best_nl;
param err_val;
param err_tr;
param err_tst;
param loc_err_tr;
param loc_err_val;
#param loc_err_tst;
param stop_tr;
param best_k;
param best_k_loc;

param gamma;
param rho1;
param rho2;

var win{1..n, 1..nl};
var v{1..nl};
#var w{1..nl};
#var c{1..n-1, 1..nl};

/*
minimize error_tr: (0.5/ptr) * sum{p in 1..ptr} ( sum{j in 1..nl}
				v[j]*
				(1 - exp(-(sum{k in 1..n-1} win[k,j]*xtr[k,p] - win[n,j])))/
				(1 + exp(-(sum{k in 1..n-1} win[k,j]*xtr[k,p] - win[n,j]))) - ytr[p])^2
				+ 0.5 * gamma * sum{i in 1..n, j in 1..nl} (win[i,j]^2 + v[j]^2);

minimize error_val: (1/pval) * sum{p in 1..pval} abs( sum{j in 1..nl}
				v[j]*
				(1 - exp(-(sum{k in 1..n-1} win[k,j]*xval[k,p] - win[n,j])))/
				(1 + exp(-(sum{k in 1..n-1} win[k,j]*xval[k,p] - win[n,j]))) - yval[p]);

minimize error_test: (1/ptest)*sum{p in 1..ptest}abs(sum{j in 1..nl}
				v[j]*
				(1 - exp(-(sum{k in 1..n-1} win[k,j]*xtest[k,p] - win[n,j])))/
				(1 + exp(-(sum{k in 1..n-1} win[k,j]*xtest[k,p] - win[n,j]))) - ytest[p]);
*/

minimize error_tr: 1/(2.0*ptr)*sum{p in 1..ptr}(sum{j in 1..nl}
				(v[j]/(1 + exp(-(sum{k in 1..n-1} win[k,j]*xtr[k,p] - win[n,j])))) - ytr[p])^2
				+ 0.5 * gamma * sum{i in 1..n, j in 1..nl} (win[i,j]^2+v[j]^2);

minimize error_val: (1/pval)*sum{p in 1..pval} abs(sum{j in 1..nl}
				(v[j]/(1 + exp(-(sum{k in 1..n-1} win[k,j]*xval[k,p] - win[n,j])))) - yval[p]);

#minimize error_test: (1/ptest)*sum{p in 1..ptest} abs(sum{j in 1..nl}
#				(v[j]/(1 + exp(-(sum{k in 1..n-1} win[k,j]*xtest[k,p] - win[n,j])))) - ytest[p]);

/*

minimize error_tr: 1/(2.0*ptr)*sum{p in 1..ptr}(sum{j in 1..nl}
				(v[j]/(1+exp(-(sum{k in 1..n-1} win[k,j]*xtr[k,p] - win[n,j])))) - ytr[p])^2
				+ 0.5 * gamma * sum{i in 1..n, j in 1..nl} (win[i,j]^2+v[j]^2);

minimize error_val: (1/pval)*sum{p in 1..pval} abs(sum{j in 1..nl}
				(v[j]/(1+exp(-(sum{k in 1..n-1} win[k,j]*xval[k,p] - win[n,j])))) - yval[p]);

			
*/		

/*
minimize error_tr: 0.5 * sum{p in 1..ptr} (sum{i in 1..nl}(	
				 	w[i]*exp(-sum{k in 1..n-1} (xtr[k,p] - c[k,i])^2) - ytr[p]))^2
					 + 0.5 * rho1 * sum{i in 1..nl} w[i]^2
					 + 0.5 * rho2 * sum{i in 1..n-1, j in 1..nl} c[i,j]^2;
				
minimize error_val: 0.5 * sum{p in 1..ptr} (sum{i in 1..nl}(	
				 	w[i]*exp(-sum{k in 1..n-1} (xtr[k,p] - c[k,i])^2) - ytr[p]));			
*/				
				
				
				
				
				
				