library(lineqGPR)


### Name: augment.lineqGP
### Title: Augmenting Method for the '"lineqGP"' S3 Class
### Aliases: augment.lineqGP

### ** Examples

# creating the model
sigfun <- function(x) return(1/(1+exp(-7*(x-0.5))))
x <- seq(0, 1, length = 5)
y <- sigfun(x)
model <- create(class = "lineqGP", x, y, constrType = "monotonicity")

# updating and expanding the model
model$localParam$m <- 30
model$kernParam$par <- c(1, 0.2)
model2 <- augment(model)
image(model2$Gamma, main = "covariance matrix")




