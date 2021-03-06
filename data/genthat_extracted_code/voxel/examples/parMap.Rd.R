library(voxel)


### Name: parMap
### Title: Create parametric maps
### Aliases: parMap

### ** Examples

image <- oro.nifti::nifti(img = array(1:1600, dim =c(4,4,4,25)))
mask <- oro.nifti::nifti(img = array(0:1, dim = c(4,4,4,1)))
set.seed(1)
covs <- data.frame(x = runif(25), y = runif(25))
fm1 <- "~ x + y"
models <- vlmParam(image=image, mask=mask, 
              formula=fm1, subjData=covs, ncores = 1)
Maps <- parMap(models, mask, method="fdr")



