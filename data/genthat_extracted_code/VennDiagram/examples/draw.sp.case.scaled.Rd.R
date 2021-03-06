library(VennDiagram)


### Name: draw.sp.case.scaled
### Title: Draw a special Venn Diagram with Three Sets. These are the
###   scaled cases
### Aliases: draw.sp.case.scaled
### Keywords: internal

### ** Examples

venn.plot <- draw.triple.venn(
	area1 = 2,
	area2 = 1,
	area3 = 3,
	n12 = 1,
	n23 = 1,
	n13 = 2,
	n123 = 1,
	category = c('A', 'B', 'C'),
	fill = c('red', 'blue', 'green'),
	cat.col = c('red', 'blue', 'green'),
	cex = c(1/2,2/2,3/2,4/2,5/2,6/2,7/2),
	cat.cex = c(1,2,3),
	euler = TRUE,
	scaled = FALSE
	);
dev.off();



