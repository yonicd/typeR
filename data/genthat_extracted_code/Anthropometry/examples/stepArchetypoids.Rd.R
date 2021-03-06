library(Anthropometry)


### Name: stepArchetypoids
### Title: Run the archetypoid algorithm several times
### Aliases: stepArchetypoids
### Keywords: array

### ** Examples

#COCKPIT DESIGN PROBLEM:
#As a toy example, only the first 25 individuals are used.
USAFSurvey_First25 <- USAFSurvey[1:25, ]
#Variable selection:
variabl_sel <- c(48, 40, 39, 33, 34, 36)
#Changing to inches: 
USAFSurvey_First25_inch <- USAFSurvey_First25[,variabl_sel] / (10 * 2.54)

#Data preprocessing:
USAFSurvey_preproc <- preprocessing(USAFSurvey_First25_inch, TRUE, 0.95, TRUE)

#For reproducing results, seed for randomness:
set.seed(2010) 
#Run archetype algorithm repeatedly from 1 to numArch archetypes:
#This is a toy example. In other situation, choose numArch=10 and numRep=20.
numArch <- 2 ; numRep <- 2
lass <- stepArchetypesRawData(data = USAFSurvey_preproc$data, numArch = 1:numArch,
                              numRep = numRep, verbose = FALSE) 
#To understand the warning messages, see the vignette of the
#archetypes package.                                

#Run archetypoids algorithm repeatedly from 1 to numArch archetypes:
for(numArchoid in 1:numArch){
 temp <-  stepArchetypoids(numArchoid,nearest="cand_ns",USAFSurvey_preproc$data,lass)
 filename <- paste("res", numArchoid, sep="")
 assign(filename,temp)
 save(list=c(filename),file=paste(filename, ".RData", sep="")) 
}



