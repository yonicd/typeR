library(onls)


### Name: y0
### Title: y0-values from orthogonal nonlinear least squares regression
### Aliases: y0
### Keywords: optimize models nonlinear

### ** Examples

DNase1 <- subset(DNase, Run == 1)
DNase1$density <- sapply(DNase1$density, function(x) rnorm(1, x, 0.1 * x))
mod <- onls(density ~ Asym/(1 + exp((xmid - log(conc))/scal)), 
             data = DNase1, start = list(Asym = 3, xmid = 0, scal = 1))
y0(mod)



