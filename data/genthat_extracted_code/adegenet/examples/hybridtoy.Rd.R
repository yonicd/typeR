library(adegenet)


### Name: hybridtoy
### Title: Toy hybrid dataset
### Aliases: hybridtoy

### ** Examples

data(hybridtoy)
x <- hybridtoy
pca1 <- dudi.pca(tab(x), scannf=FALSE, scale=FALSE)
s.class(pca1$li, pop(x))

if(require(ggplot2)) {
p <- ggplot(pca1$li, aes(x=Axis1)) +
    geom_density(aes(fill=pop(x)), alpha=.4, adjust=1) +
    geom_point(aes(y=0, color=pop(x)), pch="|", size=10, alpha=.5)
p
}

## kmeans
km <- find.clusters(x, n.pca=10, n.clust=2)
table(pop(x), km$grp)

## dapc
dapc1 <- dapc(x, pop=km$grp, n.pca=10, n.da=1)
scatter(dapc1)
scatter(dapc1, grp=pop(x))
compoplot(dapc1, col.pal=spectral, n.col=2)

## ML-EM with hybrids
res <- snapclust(x, k=2, hybrids=TRUE, detailed=TRUE)
compoplot(res, n.col=3)
table(res$group, pop(x))




