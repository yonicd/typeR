library(tripack)


### Name: plot.voronoi.polygons
### Title: plots an voronoi.polygons object
### Aliases: plot.voronoi.polygons
### Keywords: spatial

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	     or do  help(data=index)  for the standard data sets.
data(tritest)
tritest.vm <- voronoi.mosaic(tritest$x,tritest$y)
tritest.vp <- voronoi.polygons(tritest.vm)
plot(tritest.vp)
plot(tritest.vp,which=c(1,3,5))



