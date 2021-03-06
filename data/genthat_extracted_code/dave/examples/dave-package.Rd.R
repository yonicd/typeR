library(dave)


### Name: dave
### Title: Data Analysis in Vegetation Ecology
### Aliases: dave dave
### Keywords: package, dave

### ** Examples

# A typical and probably the most complex function is Mtab() that re-arranges
# the rwos and columns within a vegetation data frame and through plotting it
# illustrates the presumably emerging pattern:
y.r<- 0.5 ; y.s<- 0.2                 # defining transformations used
k.r <- 3 ; k.s <- 4                   # row- and column numbers
ndiffs <- 18                          # no. of columns used to show pattern
o.Mt<-Mtabs(nveg,"mulva" ,y.r,y.s,k.r,k.s,ndiffs)
plot(o.Mt,method="normal")
# to see the original order simply replace "mulva" by "raw"



