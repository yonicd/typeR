library(checkarg)


### Name: isNumberOrNanVector
### Title: Wrapper for the checkarg function, using specific parameter
###   settings.
### Aliases: isNumberOrNanVector

### ** Examples

isNumberOrNanVector(2)
   # returns TRUE (argument is valid)
isNumberOrNanVector("X")
   # returns FALSE (argument is invalid)
#isNumberOrNanVector("X", stopIfNot = TRUE)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanVector(2, default = 1)
   # returns 2 (the argument, rather than the default, since it is not NULL)
#isNumberOrNanVector("X", default = 1)
   # throws exception with message defined by message and argumentName parameters
isNumberOrNanVector(NULL, default = 1)
   # returns 1 (the default, rather than the argument, since it is NULL)




