library(bde)


### Name: HirukawaTSKernel
### Title: Class '"HirukawaTSKernel"'
### Aliases: HirukawaTSKernel HirukawaTSKernel-class
### Keywords: classes

### ** Examples

# create the model 
kernel.noModified <- hirukawaTSKernel(dataPoints = tuna.r, b = 0.01, 
                      modified = FALSE, c = 0.5)
kernel.Modified <- hirukawaTSKernel(dataPoints = tuna.r, b = 0.01,
                      modified = TRUE, c = 0.5)

# examples of usual functions
density(kernel.noModified,0.5)
density(kernel.Modified,0.5)

distribution(kernel.noModified,1,discreteApproximation=FALSE)
distribution(kernel.noModified,1,discreteApproximation=TRUE)
 
distribution(kernel.Modified,1,discreteApproximation=FALSE)
distribution(kernel.Modified,1,discreteApproximation=TRUE)
 
# graphical representation
hist(tuna.r,freq=FALSE,main="Chen99 Kernels Tuna Data")
lines(kernel.noModified,col="red",lwd=2)
lines(kernel.Modified,col="blue",lwd=2)

# graphical representation using ggplot2 
graph <- gplot(list("noModified"=kernel.noModified, 
          "modified"=kernel.Modified), show=TRUE)



