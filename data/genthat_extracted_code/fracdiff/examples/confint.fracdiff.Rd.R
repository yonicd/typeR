library(fracdiff)


### Name: confint.fracdiff
### Title: Confidence Intervals for Fracdiff Model Parameters
### Aliases: confint.fracdiff
### Keywords: models

### ** Examples

set.seed(101)
ts2 <- fracdiff.sim(5000, ar = .2, ma = -.4, d = .3)
mFD <- fracdiff( ts2$series, nar = length(ts2$ar), nma = length(ts2$ma))
coef(mFD)
confint(mFD)



