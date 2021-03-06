library(KrigInv)


### Name: vorobVol_optim_parallel2
### Title: Compute volume criterion
### Aliases: vorobVol_optim_parallel2

### ** Examples

#vorobVol_optim_parallel2

set.seed(9)
N <- 20 #number of observations
T <- 80 #threshold
testfun <- branin

#a 20 points initial design
design <- data.frame( matrix(runif(2*N),ncol=2) )
response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design,
            response = response,covtype="matern3_2")

###we need to compute some additional arguments:
#integration points, and current kriging means and variances at these points
integcontrol <- list(n.points=50,distrib="vorob",init.distrib="MC")
obj <- integration_design(integcontrol=integcontrol,
                          lower=c(0,0),upper=c(1,1),model=model,T=T)

integration.points <- obj$integration.points
integration.weights <- obj$integration.weights

# alpha, the pn threshold should be computed with conservativeEstimate
# Here it is fixed at 0.992364
alpha <- 0.992364

## Not run: 
##D # You can compute it with the following code
##D CE_design=as.matrix (randtoolbox::sobol (n = 500*model@d,
##D                                       dim = model@d))
##D colnames(CE_design) <- colnames(model@X)
##D 
##D CE_pred = predict.km(object = model, newdata = CE_design,
##D                           type = "UK",cov.compute = TRUE)
##D CE_pred$cov <- CE_pred$cov +1e-7*diag(nrow = nrow(CE_pred$cov),ncol = ncol(CE_pred$cov))
##D 
##D Cestimate <- anMC::conservativeEstimate(alpha = 0.95, pred=CE_pred,
##D                            design=CE_design, threshold=T, pn = NULL,
##D                            type = ">", verb = 1,
##D                            lightReturn = TRUE, algo = "GANMC")
##D alpha <- Cestimate$lvs
## End(Not run)


pred <- predict_nobias_km(object=model,newdata=integration.points,
                          type="UK",se.compute=TRUE)
intpoints.oldmean <- pred$mean ; intpoints.oldsd<-pred$sd

#another precomputation
precalc.data <- precomputeUpdateData(model,integration.points)

batchsize <- 4
other.points <- c(0.7,0.5,0.5,0.9,0.9,0.8)
x <- c(0.1,0.2)
#one evaluation of the vorobVol_optim_parallel criterion2
#we calculate the expectation of the future volume vorobev uncertainty when
#1+3 points are added to the doe
#the 1+3 points are (0.1,0.2) and (0.7,0.5), (0.5,0.9), (0.9,0.8)
vorobVol_optim_parallel2(x=x,other.points=other.points,integration.points=integration.points,
                      integration.weights=integration.weights,
                      intpoints.oldmean=intpoints.oldmean,intpoints.oldsd=intpoints.oldsd,
                      precalc.data=precalc.data,T=T,model=model,
                      batchsize=batchsize,alpha=alpha)


n.grid <- 20 #you can run it with 100
x.grid <- y.grid <- seq(0,1,length=n.grid)
x <- expand.grid(x.grid, y.grid)
vorobVol_parallel.grid <- apply(X=x,FUN=vorobVol_optim_parallel2,MARGIN=1,other.points=other.points,
                             integration.points=integration.points,
                             integration.weights=integration.weights,
                             intpoints.oldmean=intpoints.oldmean,intpoints.oldsd=intpoints.oldsd,
                             precalc.data=precalc.data,T=T,model=model,
                             batchsize=batchsize,alpha=alpha)
z.grid <- matrix(vorobVol_parallel.grid, n.grid, n.grid)

#plots: contour of the criterion, doe points and new point
image(x=x.grid,y=y.grid,z=z.grid,col=grey.colors(10))
contour(x=x.grid,y=y.grid,z=z.grid,15,add=TRUE)
points(design, col="black", pch=17, lwd=4,cex=2)
points(matrix(other.points,ncol=2,byrow=TRUE), col="red", pch=17, lwd=4,cex=2)

# Note that we want to maximize this criterion.
i.best <- which.max(vorobVol_parallel.grid)
points(x[i.best,], col="blue", pch=17, lwd=4,cex=3)

#plots the real (unknown in practice) curve f(x)=T
testfun.grid <- apply(x,1,testfun)
z.grid.2 <- matrix(testfun.grid, n.grid, n.grid)
contour(x.grid,y.grid,z.grid.2,levels=T,col="blue",add=TRUE,lwd=5)
title("Contour lines of vorobVol_parallel criterion (black) and of f(x)=T (blue)")






