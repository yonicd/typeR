library(RJaCGH)


### Name: trace.plot
### Title: Trace plot for 'RJaCGH' object
### Aliases: trace.plot
### Keywords: models

### ** Examples

y <- c(rnorm(100, 0, 1), rnorm(10, -3, 1), rnorm(20, 3, 1), rnorm(100,
0, 1))
Pos <- sample(x=1:500, size=230, replace=TRUE)
Pos <- cumsum(Pos)
Chrom <- rep(1:23, rep(10, 23))
jp <- list(sigma.tau.mu=rep(0.5, 5), sigma.tau.sigma.2=rep(0.3, 5),
sigma.tau.beta=rep(0.7, 5), tau.split.mu=0.5, tau.split.beta=0.5)
fit.genome <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Genome",
burnin=10, TOT=100, jump.parameters=jp, k.max = 5)
trace.plot(fit.genome, array="array1")



