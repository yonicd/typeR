library(bartMachine)


### Name: bartMachineArr
### Title: Create an array of BART models for the same data.
### Aliases: bartMachineArr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Regression example
## Not run: 
##D #generate Friedman data
##D set.seed(11)
##D n  = 200 
##D p = 5
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##build BART regression model
##D bart_machine = bartMachine(X, y)
##D bart_machine_arr = bartMachineArr(bart_machine)
##D 
##D #Classification example
##D data(iris)
##D iris2 = iris[51 : 150, ] #do not include the third type of flower for this example
##D iris2$Species = factor(iris2$Species)  
##D bart_machine = bartMachine(iris2[ ,1:4], iris2$Species)
##D bart_machine_arr = bartMachineArr(bart_machine)
## End(Not run)





