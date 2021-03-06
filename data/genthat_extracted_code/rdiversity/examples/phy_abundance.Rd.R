library(rdiversity)


### Name: phy_abundance
### Title: Calculate abundance of historical species
### Aliases: phy_abundance

### ** Examples

tree <- ape::rtree(n = 5)
tree$tip.label <- paste0("sp", seq_along(tree$tip.label))
partition <- cbind(a = c(1,1,1,0,0), b = c(0,1,0,1,1))
row.names(partition) <- tree$tip.label
partition <- partition / sum(partition)
ps <- phy_struct(tree, partition)
structure_matrix <- ps$structure
phy_abundance(partition, structure_matrix)




