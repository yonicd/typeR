context("PLSOL")
library(MASS)

run_data_test <- function(data, alg, r=NULL, cutoff=0.35, sep=TRUE, piled=FALSE){
  result <- lapply(data, function(dat) {
    embed <- do.call(alg, list(X=dat$dat$X, Y=dat$dat$Y, r=r))
    if (piled) {
      expect_true(all(apply(embed$Xr[, 1, drop=FALSE], 1, function(x) length(unique(x)) == 1)))
      if (dat$operator == '<') {
        return(0)
      } else if (dat$operator == ">") {
        return(1)
      }
    }
    if (!is.null(r)) {
      expect_equal(dim(embed$Xr), c(n, r))
    }
    class <- do.call(lda, list(embed$Xr, dat$dat$Y))
    pred <- predict(class, embed$Xr)
    lhat <- sum(pred$class != dat$dat$Y)/length(dat$dat$Y)
    if  (!is.null(cutoff)) {
      expect_true(do.call(dat$operator, list(lhat, cutoff)))
    }
    return(lhat)
  })
  if (sep) {
    expect_lt(result$separable, result$unseparable)
  }
  return(result)
}

set.seed(123456)
alg=lol.project.plsol
# Full-Rank Cases
n <- 100
d <- 6
K <- 2
data <- list(separable=list(dat=lol.sims.mean_diff(n, d, md=5), operator='<'),
             unseparable=list(dat=lol.sims.mean_diff(n, d, md=0), operator='>'))
cutoff <- 0.35

test_that("PLSOL full-rank fails for r > d", {
  expect_error(alg(data$separable$dat$X, data$separable$dat$Y, d+1))
})

test_that("PLSOL full-rank r == d", {
  r <- d
  run_data_test(data, alg=alg, r)
})

test_that("PLSOL full-rank r == K+1", {
  r <- K+1
  run_data_test(data, alg=alg, r)
})

test_that("PLSOL full-rank r == K", {
  r <- K
  run_data_test(data, alg=alg, r)
})

test_that("PLSOL full-rank r == 1", {
  r <- 1
  run_data_test(data, alg=alg, r=r, cutoff=cutoff)
})


set.seed(12345)
# Low-Rank Cases
n <- 100
d <- 110
K <- 2
data <- list(separable=list(dat=lol.sims.mean_diff(n, d, md=5),  operator='<'),
             unseparable=list(dat=lol.sims.mean_diff(n, d, md=0), operator='>'))

test_that("PLSOL low-rank fails for r > d", {
  expect_error(alg(data$separable$dat$X, data$separable$dat$Y, d+1))
})

test_that("PLSOL low-rank r == K+1", {
  r <- K+1
  run_data_test(data, alg=alg, r, cutoff=NULL)
})

test_that("PLSOL low-rank r == K", {
  r <- K
  run_data_test(data, alg=alg, r, cutoff=NULL)
})

test_that("PLSOL low-rank r == 1", {
  r <- 1
  run_data_test(data, alg=alg, r=r, cutoff=NULL)
})

n <- 100
d <- 3
test_that("PLSOL works with 3-class", {
  data <- lol.sims.mean_diff(n, d, K=d+1, md=3)
  expect_error(alg(data$X, data$Y, d-1), NA)
})
