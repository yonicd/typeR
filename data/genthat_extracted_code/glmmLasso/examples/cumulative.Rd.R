library(glmmLasso)


### Name: cumulative
### Title: Family Object for Ordinal Regression with Cumulative
###   Probabilities
### Aliases: cumulative
### Keywords: ordinal regression

### ** Examples

## Not run: 
##D data(knee)
##D 
##D knee[,c(2,4:6)]<-scale(knee[,c(2,4:6)],center=TRUE,scale=TRUE)
##D knee<-data.frame(knee)
##D 
##D ## fit adjacent category model
##D glm.obj <- glmmLasso(pain ~ time + th + age + sex, rnd = NULL,  
##D         family = cumulative(), data = knee, lambda=10,
##D         switch.NR=TRUE, control=list(print.iter=TRUE)) 
##D 
##D summary(glm.obj)
## End(Not run)


