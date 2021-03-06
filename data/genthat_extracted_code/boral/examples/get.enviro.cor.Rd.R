library(boral)


### Name: get.enviro.cor
### Title: Extract covariances and correlations due to shared environmental
###   responses from boral models
### Aliases: get.enviro.cor

### ** Examples

## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D      n.thin = 1)
##D      
##D library(mvabund) ## Load a dataset from the mvabund package
##D library(corrplot) ## For plotting correlations
##D data(spider)
##D y <- spider$abun
##D X <- scale(spider$x)
##D n <- nrow(y)
##D p <- ncol(y)
##D     
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D      save.model = TRUE, mcmc.control = example_mcmc_control)
##D 
##D enviro.cors <- get.enviro.cor(spiderfit_nb)
##D 
##D corrplot(enviro.cors$sig.cor, title = "Shared response correlations", 
##D 	type = "lower", diag = FALSE, mar = c(3,0.5,2,1), tl.srt = 45)
## End(Not run)



