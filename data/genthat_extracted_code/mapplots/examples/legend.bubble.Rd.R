library(mapplots)


### Name: legend.bubble
### Title: Legend for bubble plot
### Aliases: legend.bubble

### ** Examples

data(landings)
data(coast)
xlim <- c(-12,-5)
ylim <- c(50,56)
agg <- aggregate(list(z=landings$LiveWeight),list(x=landings$Lon,y=landings$Lat),sum)
basemap(xlim, ylim, main = "Gadoid landings")
draw.shape(coast, col="cornsilk")
draw.bubble(agg$x, agg$y, agg$z, maxradius=0.5, pch=21, bg="#00FF0050")
legend.bubble("topright", z=round(max(agg$z)/1000,0), maxradius=0.5, inset=0.02, bg="lightblue",
 txt.cex=0.8, pch=21, pt.bg="#00FF0050")



