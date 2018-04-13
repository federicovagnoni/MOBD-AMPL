param ptr, integer;   #numero di elementi nel training set
param pval, integer;  #numero di elementi nel validation set
param ptest, integer; #numeri di elementi nel test set
param n, integer;	  #numero di features + y
param nl, integer; 	  #numero di neuroni nello strato nascosto

# file path
param validationFile symbolic;
param trainingFile symbolic;
param testFile symbolic;

# x and y value for training, validation and test
param xtr{1..n-1, 1..ptr};
param ytr{1..ptr};
param xval{1..n-1, 1..pval};
param yval{1..pval};
param xtest{1..n-1, 1..ptest};
param ytest{1..ptest};
param best_nl;

# error and lcoal error for training and validation
param err_val;
param err_tr;
param err_test;
param loc_err_tr;
param loc_err_val;
param loc_err_test;

# early stopping criterion parameters
param stop_tr;
param best_k;
param best_k_loc;
param nmax;

# inf and sup for Unifrom generation of win and v
param rangeinf;
param rangesup;

param gamma;
param c;

param lbx{1..24};
param ubx{1..24};

var win{1..n, 1..nl};	# input weight 
var v{1..nl};			# output weight


# Logistic function as activation function for neural network
minimize error_tr: 1/(2.0*ptr)*sum{p in 1..ptr}(sum{j in 1..nl}
				(v[j]/(1 + exp(- c * (sum{k in 1..n-1} win[k,j]*xtr[k,p] - win[n,j])))) - ytr[p])^2
				+ 0.5 * gamma * sum{i in 1..n, j in 1..nl} (win[i,j]^2+v[j]^2);

# Validation error computation for neural network
minimize error_val: (1/pval)*sum{p in 1..pval} abs(sum{j in 1..nl}
				(v[j]/(1 + exp(- c * (sum{k in 1..n-1} win[k,j]*xval[k,p] - win[n,j])))) - yval[p]);
	
# Test error computation for neural network			
minimize error_test: (1/ptest)*sum{p in 1..ptest} abs(sum{j in 1..nl}
				(v[j]/(1 + exp(- c * (sum{k in 1..n-1} win[k,j]*xtest[k,p] - win[n,j])))) - ytest[p]);								