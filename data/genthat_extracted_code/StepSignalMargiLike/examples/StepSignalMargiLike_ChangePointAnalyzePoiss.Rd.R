library(StepSignalMargiLike)


### Name: StepSignalMargiLike_ChangePointAnalyzePoiss
### Title: StepSignalMargiLike_ChangePointAnalyzePoiss
### Aliases: StepSignalMargiLike_ChangePointAnalyzePoiss

### ** Examples

n <- 20
max.segs <- 20

data.x <- rpois(n, 1)
data.x <- c(data.x, rpois(n, 10))
data.x <- c(data.x, rpois(n, 50))
data.x <- c(data.x, rpois(n, 20))
data.x <- c(data.x, rpois(n, 80))

prior <- prior.pois(data.x)

ChangePointAnalyzePoiss(data.x, n, max.segs, prior)



