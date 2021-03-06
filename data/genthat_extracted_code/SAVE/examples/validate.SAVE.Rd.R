library(SAVE)


### Name: validate
### Title: Validation of a computer model
### Aliases: validate.SAVE-class validate,SAVE-method validate
###   summary.validate.SAVE summary,validate.SAVE-method
###   show.summary.validate.SAVE plot.validate.SAVE
###   plot,validate.SAVE-method show,summary.validate.SAVE-method
###   show,validate.SAVE-method

### ** Examples

## Not run: 
##D library(SAVE)
##D 
##D #############
##D # load data
##D #############
##D 
##D data(spotweldfield,package='SAVE')
##D data(spotweldmodel,package='SAVE')
##D 
##D ##############
##D # create the SAVE object which describes the problem and
##D # compute the corresponding mle estimates
##D ##############
##D 
##D gfsw <- SAVE(response.name="diameter", controllable.names=c("current", "load", "thickness"), 
##D 			 calibration.names="tuning", field.data=spotweldfield, 
##D 			 model.data=spotweldmodel, mean.formula=~1, 
##D 			 bestguess=list(tuning=4.0))
##D 
##D ##############
##D # obtain the posterior distribution of the unknown parameters 
##D ##############
##D 
##D gfsw <- bayesfit(object=gfsw, prior=c(uniform("tuning", upper=8, lower=0.8)), 
##D 				 n.iter=20000, n.burnin=100, n.thin=2)
##D 
##D ##############
##D # validate the computer model at chosen set of controllable
##D # inputs
##D ###############
##D 
##D load <- c(4.0,5.3)
##D curr <- seq(from=20,to=30,length=20)
##D g <- c(1,2)
##D 
##D xnew <- expand.grid(current = curr, load = load, thickness=g)
##D 
##D valsw <- validate(object=gfsw,newdesign=xnew,n.burnin=100)
##D 
##D # summary of results
##D summary(valsw)
##D # plot results
##D plot(valsw)
##D 
##D 
##D 	
## End(Not run)



