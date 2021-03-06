library(NHMSAR)


### Name: MeanDurOver
### Title: Mean Duration of sojourn over a treshold
### Aliases: MeanDurOver
### Keywords: Mean Duration of Sojourn Threshold excess

### ** Examples

data(meteo.data)
data = array(meteo.data$temperature,c(31,41,1)) 
k = 40
T = dim(data)[1]
N.samples = dim(data)[2]
d = dim(data)[3]
M = 2
order = 2
theta.init = init.theta.MSAR(data,M=M,order=order,label="HH")
mod.hh= NULL
mod.hh$theta = theta.init
mod.hh$theta$A = matrix(c(0.40,0.88,-.09,-.13),2,2)
mod.hh$theta$A0 = matrix(c(6.75,1.08),2,1)
mod.hh$theta$sigma = matrix(c(1.76,3.40),2,1)
mod.hh$theta$prior = matrix(c(0.37,0.63),2,1)
mod.hh$theta$transmat = matrix(c(0.82,0.09,0.18,0.91),2,2)
B.sim = 20*N.samples
Y0 = array(data[1:2,sample(1:dim(data)[2],B.sim,replace=TRUE),],c(2,B.sim,1))
Y.sim = simule.nh.MSAR(mod.hh$theta,Y0=Y0,T,N.samples=B.sim)
u = seq(min(data),max(data),length.out=30)
MDO = MeanDurOver(data,Y.sim$Y,u)



