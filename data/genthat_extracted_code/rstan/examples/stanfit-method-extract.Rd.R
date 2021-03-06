library(rstan)


### Name: extract
### Title: Extract samples from a fitted Stan model
### Aliases: extract extract,stanfit-method
### Keywords: methods

### ** Examples
## Not run: 
##D ex_model_code <- '
##D   parameters {
##D     real alpha[2,3];
##D     real beta[2]; 
##D   } 
##D   model {
##D     for (i in 1:2) for (j in 1:3) 
##D       alpha[i, j] ~ normal(0, 1); 
##D     for (i in 1:2) 
##D       beta ~ normal(0, 2); 
##D   } 
##D '
##D 
##D ## fit the model 
##D fit <- stan(model_code = ex_model_code, chains = 4) 
##D 
##D ## extract alpha and beta with 'permuted = TRUE' 
##D fit_ss <- extract(fit, permuted = TRUE) # fit_ss is a list 
##D ## list fit_ss should have elements with name 'alpha', 'beta', 'lp__'
##D alpha <- fit_ss$alpha  
##D beta <- fit_ss$beta 
##D ## or extract alpha by just specifying pars = 'alpha' 
##D alpha2 <- extract(fit, pars = 'alpha', permuted = TRUE)$alpha 
##D print(identical(alpha, alpha2)) 
##D 
##D ## or extract alpha by excluding beta and lp__
##D alpha3 <- extract(fit, pars = c('beta', 'lp__'), 
##D                   permuted = TRUE, include = FALSE)$alpha
##D print(identical(alpha, alpha3))
##D 
##D ## get the samples for alpha[1,1] and beta[2] 
##D alpha_11 <- alpha[, 1, 1] 
##D beta_2 <- beta[, 2] 
##D 
##D ## extract samples with 'permuted = FALSE' 
##D fit_ss2 <- extract(fit, permuted = FALSE) # fit_ss2 is an array  
##D 
##D ## the dimensions of fit_ss2 should be  
##D ## "# of iterations * # of chains * # of parameters"
##D dim(fit_ss2) 
##D 
##D ## since the third dimension of `fit_ss2` indicates 
##D ## parameters, the names should be 
##D ##  alpha[1,1], alpha[2,1], alpha[1,2], alpha[2,2], 
##D ##  alpha[1,3], alpha[2,3], beta[1], beta[2], and lp__ 
##D ## `lp__` (the log-posterior) is always included 
##D ## in the samples.  
##D dimnames(fit_ss2) 
## End(Not run)

# Create a stanfit object from reading CSV files of samples (saved in rstan
# package) generated by funtion stan for demonstration purpose from model as follows. 
# 
excode <- '
  transformed data {
    real y[20];
    y[1] <- 0.5796;  y[2]  <- 0.2276;   y[3] <- -0.2959; 
    y[4] <- -0.3742; y[5]  <- 0.3885;   y[6] <- -2.1585;
    y[7] <- 0.7111;  y[8]  <- 1.4424;   y[9] <- 2.5430; 
    y[10] <- 0.3746; y[11] <- 0.4773;   y[12] <- 0.1803; 
    y[13] <- 0.5215; y[14] <- -1.6044;  y[15] <- -0.6703; 
    y[16] <- 0.9459; y[17] <- -0.382;   y[18] <- 0.7619;
    y[19] <- 0.1006; y[20] <- -1.7461;
  }
  parameters {
    real mu;
    real<lower=0, upper=10> sigma;
    vector[2] z[3];
    real<lower=0> alpha;
  } 
  model {
    y ~ normal(mu, sigma);
    for (i in 1:3) 
      z[i] ~ normal(0, 1);
    alpha ~ exponential(2);
  } 
'
# exfit <- stan(model_code = excode, save_dso = FALSE, iter = 200, 
#               sample_file = "rstan_doc_ex.csv")
# 
exfit <- read_stan_csv(dir(system.file('misc', package = 'rstan'),
                       pattern='rstan_doc_ex_[[:digit:]].csv',
                       full.names = TRUE))

ee1 <- extract(exfit, permuted = TRUE)
print(names(ee1))

for (name in names(ee1)) {
  cat(name, "\n")
  print(dim(ee1[[name]]))
}

ee2 <- extract(exfit, permuted = FALSE)
print(dim(ee2))
print(dimnames(ee2))



