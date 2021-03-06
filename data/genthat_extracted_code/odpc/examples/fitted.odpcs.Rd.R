library(odpc)


### Name: fitted.odpcs
### Title: Get Reconstructed Time Series From an odpcs Object
### Aliases: fitted.odpcs
### Keywords: ts

### ** Examples

  T <- 200 #length of series
  m <- 10 #number of series
  set.seed(1234)
  f <- rnorm(T + 1)
  x <- matrix(0, T, m)
  u <- matrix(rnorm(T * m), T, m)
  for (i in 1:m) {
    x[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:T] + 10 * cos(2 * pi * (i/m)) * f[2:(T + 1)] + u[, i]
  }
  fit <- odpc(x, ks = matrix(c(1, 1, 1, 0), 2, 2))
  recons <- fitted(fit, num_comp = 2)



