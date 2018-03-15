param ptr, integer;   #numero di elementi nel training set
param pval, integer;  #numero di elementi nel validation set
param ptest, integer; #numeri di elementi nel test set
param n, integer;	  #numero di features + y
param nl, integer; 	  #numero di neuroni nello strato nascosto

param xtr{1..n-1, 1..ptr};
param ytr{1..ptr};
param xval{1..n-1, 1..pval};
param yval{1..pval};

param best_nl;
param err_val;
param err_tr;
param loc_err_tr;
param loc_err_val;
param stop_tr;
param best_k;
param best_k_loc;

/*param school{1..n, 1..ptr};
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
param G3{1..n, 1..ptr};*/

param gamma;
param rho1;
param rho2;

var win{1..n, 1..nl};
var v{1..nl};
#var w{1..nl};
#var c{1..n-1, 1..nl};


minimize error_tr: (0.5/ptr) * sum{p in 1..ptr} ( sum{j in 1..nl}
				v[j]*
				(1 - exp(-(sum{k in 1..n-1} win[k,j]*xtr[k,p] - win[n,j])))/
				(1 + exp(-(sum{k in 1..n-1} win[k,j]*xtr[k,p] - win[n,j]))) - ytr[p])^2
				+ 0.5 * gamma * sum{i in 1..n, j in 1..nl} (win[i,j]^2 + v[j]^2);

minimize error_val: (1/pval) * sum{p in 1..pval} abs( sum{j in 1..nl}
				v[j]*
				(1 - exp(-(sum{k in 1..n-1} win[k,j]*xval[k,p] - win[n,j])))/
				(1 + exp(-(sum{k in 1..n-1} win[k,j]*xval[k,p] - win[n,j]))) - yval[p]);

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
				
				
				
				
				
				