library(rlist)


### Name: subset.list
### Title: Subset a list by a logical condition
### Aliases: subset.list

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
subset(x, type == 'B')
subset(x, select = score)
subset(x, min(score$c1, score$c2) >= 8, data.frame(score))
subset(x, type == 'B', score$c1)
do.call(rbind,
   subset(x, min(score$c1, score$c2) >= 8, data.frame(score)))



