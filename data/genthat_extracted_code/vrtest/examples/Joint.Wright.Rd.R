library(vrtest)


### Name: Joint.Wright
### Title: A Joint Version of Wight's Rank and Sign Test
### Aliases: Joint.Wright
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                           
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])    
kvec <- c(2,5,10)
Joint.Wright(r,kvec) 



