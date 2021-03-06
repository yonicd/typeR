library(lineup)


### Name: calc.locallod
### Title: Calculate LOD score at physical position of each gene
### Aliases: calc.locallod
### Keywords: utilities

### ** Examples

data(f2cross, expr1, genepos, pmap)
library(qtl)
## Don't show: 
n_ind <- 20
n_genes <- 5
f2cross <- f2cross[,1:n_ind]
expr1 <- expr1[1:n_ind,1:n_genes]
genepos <- genepos[1:n_genes,]
## End(Don't show)
# calc QTL genotype probabilities
f2cross <- calc.genoprob(f2cross, step=1)

# find nearest pseudomarkers
pmark <- find.gene.pseudomarker(f2cross, pmap, genepos, "prob")

# line up f2cross and expr1
id <- findCommonID(f2cross, expr1)

# calculate LOD score for local eQTL
locallod <- calc.locallod(f2cross[,id$first], expr1[id$second,], pmark)




