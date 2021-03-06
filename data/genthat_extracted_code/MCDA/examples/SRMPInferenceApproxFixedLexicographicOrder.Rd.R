library(MCDA)


### Name: SRMPInferenceApproxFixedLexicographicOrder
### Title: Approximative inference of an SRMP model given the lexicographic
###   order of the profiles
### Aliases: SRMPInferenceApproxFixedLexicographicOrder
### Keywords: methods

### ** Examples

performanceTable <- rbind(c(10,10,9),c(10,9,10),c(9,10,10),c(9,9,10),c(9,10,9),c(10,9,9),
                          c(10,10,7),c(10,7,10),c(7,10,10),c(9,9,17),c(9,17,9),c(17,9,9),
                          c(7,10,17),c(10,17,7),c(17,7,10),c(7,17,10),c(17,10,7),c(10,7,17),
                          c(7,9,17),c(9,17,7),c(17,7,9),c(7,17,9),c(17,9,7),c(9,7,17))

lexicographicOrder <- c(1,2,3)

criteriaMinMax <- c("max","max","max")

rownames(performanceTable) <- c("a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11",
                                "a12","a13","a14","a15","a16","a17","a18","a19","a20",
                                "a21","a22","a23","a24")

colnames(performanceTable) <- c("c1","c2","c3")

names(criteriaMinMax) <- colnames(performanceTable)

# expected result for the tests below

expectedpreorder <- list("a16","a13",c("a3","a9"),"a14","a17",c("a1","a7"),"a18","a15")

# test - preferences and indifferences

preferencePairs <- matrix(c("a16","a13","a3","a14","a17","a1","a18","a15","a2","a11",
                            "a5","a10","a4","a12","a13","a3","a14","a17","a1","a18",
                            "a15","a2","a11","a5","a10","a4","a12","a6"),14,2)
indifferencePairs <- matrix(c("a3","a1","a2","a11","a11","a20","a10","a10","a19","a12",
                              "a12","a21","a9","a7","a8","a20","a22","a22","a19","a24",
                              "a24","a21","a23","a23"),12,2)

set.seed(1)

result<-SRMPInferenceApproxFixedLexicographicOrder(performanceTable, criteriaMinMax,
                                                   lexicographicOrder, preferencePairs,
                                                   indifferencePairs, alternativesIDs =
                                                   c("a1","a3","a7","a9","a13","a14",
                                                   "a15","a16","a17","a18"))



