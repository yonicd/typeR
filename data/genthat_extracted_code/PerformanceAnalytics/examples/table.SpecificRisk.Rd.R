library(PerformanceAnalytics)


### Name: table.SpecificRisk
### Title: Specific risk Summary: Statistics and Stylized Facts
### Aliases: table.SpecificRisk

### ** Examples


data(managers)
table.SpecificRisk(managers[,1:8], managers[,8])

require("Hmisc")
result = t(table.SpecificRisk(managers[,1:8], managers[,8], Rf=.04/12))

textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE, cdec=c(3,3,1)),
rmar = 0.8, cmar = 2,  max.cex=.9, halign = "center", valign = "top", 
row.valign="center", wrap.rownames=20, wrap.colnames=10, 
col.rownames=c("red", rep("darkgray",5), rep("orange",2)), mar = c(0,0,3,0)+0.1)
title(main="Portfolio specific, systematic and total risk")




