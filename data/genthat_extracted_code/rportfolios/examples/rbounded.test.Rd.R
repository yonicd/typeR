library(rportfolios)


### Name: rbounded.test
### Title: Random bounded portfolios
### Aliases: rbounded.test
### Keywords: math

### ** Examples

###
### standard long only portfolio
###
p.1.matrix <- rbounded.test( 400, 30, 1 )

###
### 3% lower bound for all investments
### 100% upper bound for all investments
###
x.lb.all.3 <- rep( 0.03, 30 )
x.ub.all.100 <- rep( 1, 30 )
p.2.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.all.3, x.u= x.ub.all.100 )
###
### 4% upper bound for all investments
### 3% lower bound for all investments
x.ub.all.4 <- rep( 0.04, 30 )
p.3.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.all.3, x.u = x.ub.all.4 )
###
### 2% lower bound for 1-10, 3% lower bound for 11-20, 2% lower bound for 21-30
### 100% upper bound for all investments
###
x.lb.2.3.2 <- c( rep( 0.02, 10 ), rep( 0.03, 10 ), rep( 0.02, 10 ) )
p.4.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.2.3.2, x.u = x.ub.all.100 )
###
### 3% lower bound for 1-10, 2% lower bound for 11-20, 3% lower bound for 21-30
### 100% upper bound for all investments
###
x.lb.3.2.3 <- c( rep( 0.03, 10 ), rep( 0.02, 10 ), rep( 0.03, 10 ) )
p.5.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.3.2.3, x.u = x.ub.all.100 )
###
### 2% lower bound for 1-10, 3% lower bound for 11-20, 2% lower bound for 21-30
### 4% upper bound for all investments
###
x.lb.2.3.2 <- c( rep( 0.02, 10 ), rep( 0.03, 10 ), rep( 0.02, 10 ) )
p.6.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.2.3.2, x.u = x.ub.all.4 )
###
### 3% lower bound for 1-10, 2% lower bound for 11-20, 3% lower bound for 21-30
### 4% upper bound for all investments
###
x.lb.3.2.3 <- c( rep( 0.03, 10 ), rep( 0.02, 10 ), rep( 0.03, 10 ) )
p.7.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.3.2.3, x.u = x.ub.all.4 )
###
### 3% lower bound for all investments
### 4% upper bound for 1-10 5% for 11-20 and 4% for 21-30
###
x.ub.4.5.4 <- c( rep( 0.04, 10 ), rep( 0.05, 10 ), rep( 0.04, 10 ) )
p.8.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.all.3, x.u= x.ub.4.5.4 )
###
### 3% lower bound for all investments
### 5% upper bound for 1-10 4% for 11-20 and 5% for 21-30
###
x.ub.5.4.5 <- c( rep( 0.05, 10 ), rep( 0.04, 10 ), rep( 0.05, 10 ) )
p.9.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.all.3, x.u= x.ub.5.4.5 )
###
### 3% lower bound for 1-10, 2% for 11-20, 3% for 21-30
### 4% upper bound for 1-10  5% for 11-20  4% for 21-30
###
p.10.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.3.2.3, x.u = x.ub.4.5.4 )
###
### 2% lower bound for 1-10, 3% for 11-20, 2% for 21-30
### 4% upper bound for 1-10  5% for 11-20  4% for 21-30
###
p.11.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.2.3.2, x.u = x.ub.4.5.4 )
###
### 3% lower bound for 1-10, 2% for 11-20, 3% for 21-30
### 5% upper bound for 1-10  4% for 11-20  5% for 21-30
###
p.12.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.3.2.3, x.u = x.ub.5.4.5 )
###
### 2% lower bound for 1-10, 3% for 11-20, 2% for 21-30
### 5% upper bound for 1-10  4% for 11-20  5% for 21-30
###
p.13.matrix <- rbounded.test( 400, 30, 1, x.l = x.lb.2.3.2, x.u = x.ub.5.4.5 )



