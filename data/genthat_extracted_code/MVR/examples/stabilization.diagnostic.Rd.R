library(MVR)


### Name: stabilization.diagnostic
### Title: Function for Plotting Summary Variance Stabilization Diagnostic
###   Plots
### Aliases: stabilization.diagnostic
### Keywords: Mean-Variance Estimators Regularization Variance
###   Stabilization Normalization

### ** Examples

## Not run: 
##D     #===================================================
##D     # Loading the library and its dependencies
##D     #===================================================
##D     library("MVR")
##D 
##D     #===================================================
##D     # MVR package news
##D     #===================================================
##D     MVR.news()
##D 
##D     #================================================
##D     # MVR package citation
##D     #================================================
##D     citation("MVR")
##D 
##D     #===================================================
##D     # Loading of the Synthetic and Real datasets
##D     # (see description of datasets)
##D     #===================================================
##D     data("Synthetic", "Real", package="MVR")
##D     ?Synthetic
##D     ?Real
##D 
##D     #===================================================
##D     # Mean-Variance Regularization (Real dataset)
##D     # Multi-Group Assumption
##D     # Assuming unequal variance between groups
##D     # Without cluster usage
##D     #===================================================
##D     nc.min <- 1
##D     nc.max <- 30
##D     probs <- seq(0, 1, 0.01)
##D     n <- 6
##D     GF <- factor(gl(n = 2, k = n/2, length = n), 
##D                  ordered = FALSE, 
##D                  labels = c("M", "S"))
##D     mvr.obj <- mvr(data = Real, 
##D                    block = GF, 
##D                    log = FALSE, 
##D                    nc.min = nc.min, 
##D                    nc.max = nc.max, 
##D                    probs = probs,
##D                    B = 100, 
##D                    parallel = FALSE, 
##D                    conf = NULL,
##D                    verbose = TRUE,
##D                    seed = 1234)
##D 
##D     #===================================================
##D     # Summary Stabilization Diagnostic Plots (Real dataset)
##D     # Multi-Group Assumption
##D     # Assuming unequal variance between groups
##D     #===================================================
##D     stabilization.diagnostic(obj = mvr.obj, 
##D                              title = "Stabilization Diagnostic Plots 
##D                              (Real - Multi-Group Assumption)",
##D                              span = 0.75, 
##D                              degree = 2, 
##D                              family = "gaussian",
##D                              device = NULL,
##D                              horizontal = FALSE, 
##D                              width = 7, 
##D                              height = 5)
##D     
## End(Not run)



