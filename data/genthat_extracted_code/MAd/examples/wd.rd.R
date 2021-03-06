library(MAd)


### Name: wd
### Title: Output to Word in formatted tables
### Aliases: wd
### Keywords: word

### ** Examples

# Sample data
id<-c(1:20)
n.1<-c(10,20,13,22,28,12,12,36,19,12,36,75,33,121,37,14,40,16,14,20)
n.2 <- c(11,22,10,20,25,12,12,36,19,11,34,75,33,120,37,14,40,16,10,21)
g <- c(.68,.56,.23,.64,.49,-.04,1.49,1.33,.58,1.18,-.11,1.27,.26,.40,.49,
.51,.40,.34,.42,1.16)
var.g <- c(.08,.06,.03,.04,.09,.04,.009,.033,.0058,.018,.011,.027,.026,.0040,
.049,.0051,.040,.034,.0042,.016)
mod<-factor(c(rep(c(1,1,2,3),5)))
mods2<-c(rep(1:5,4))
df<-data.frame(id, n.1,n.2, g, var.g,mod, mods2)


# Examples

# install R2wd
# install.packages('R2wd', dependencies = TRUE)

# mareg fuction
temp <- mareg(g~ mod + mods2, var = var.g, method = "REML", data = df)

# Export data to Word in formatted table
## Not run: wd(temp, get = TRUE, new = TRUE)



