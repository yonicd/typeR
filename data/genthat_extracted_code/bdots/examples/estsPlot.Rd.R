library(bdots)


### Name: ests.plot
### Title: Plot Parameter Estimates
### Aliases: ests.plot
### Keywords: htest

### ** Examples

## Not run: 
##D data(ci)
##D ci.1 <- subset(ci, ci$LookType == "Target")
##D ci.1$Group <- ci.1$protocol
##D out.1 <- logistic.fit(ci.1, 4)ests.plot(out.1)
##D ests.plot(out.1)
## End(Not run)


