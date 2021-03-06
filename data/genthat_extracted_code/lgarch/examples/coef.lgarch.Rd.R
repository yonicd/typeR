library(lgarch)


### Name: coef.lgarch
### Title: Extraction methods for 'lgarch' objects
### Aliases: coef.lgarch fitted.lgarch logLik.lgarch print.lgarch rss
###   residuals.lgarch summary.lgarch vcov.lgarch
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##simulate 500 observations w/default parameter values:
set.seed(123)
y <- lgarchSim(500)

##estimate a log-garch(1,1):
mymod <- lgarch(y)

##print results:
print(mymod)

##extract coefficients:
coef(mymod)

##extract Gaussian log-likelihood (zeros excluded) of the log-garch model:
logLik(mymod)

##extract the Residual Sum of Squares of the ARMA representation:
rss(mymod)

##extract log-likelihood (zeros excluded) of the ARMA representation:
logLik(mymod, arma=TRUE)

##extract variance-covariance matrix:
vcov(mymod)

##extract and plot the fitted conditional standard deviation:
sdhat <- fitted(mymod)
plot(sdhat)

##extract and plot standardised residuals:
zhat <- residuals(mymod)
plot(zhat)

##extract and plot all the fitted series:
myhat <- fitted(mymod, verbose=TRUE)
plot(myhat)




