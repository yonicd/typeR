library(rphast)


### Name: label.branches
### Title: Label tree branches
### Aliases: label.branches
### Keywords: trees

### ** Examples

trees <- c("((hg18:1.0, panTro2:2.0)hg18-panTro2:3.0, mm9:4.0);",
           "((hg18:0.142679,(mm9:0.083220,rn4:0.090564)mm9-rn4:
             0.269385)hg18-rn4:0.020666,canFam2:0.193569);")
label.branches(trees, c("hg18", "mm9"), "humanAndMouse")



