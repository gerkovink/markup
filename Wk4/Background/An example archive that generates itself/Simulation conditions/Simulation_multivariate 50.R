#set random seed
set.seed(123)

#create population data
#Sigma <- matrix(c(10,9,9, 9, 10, 9, 6, 3,10),3,3)
#Sigma=matrix(c(1,0.8,0.8, 0.8,1,0.8, 0.8,0.8,1),3,3)
Sigma=matrix(c(1,0.1,0.1, 0.1,1,0.1, 0.1,0.1,1),3,3)
population <- as.data.frame(mvrnorm(n=populationsize, c(1, 2, 3), Sigma))
colnames(population) <- c("x", "ymis1", "ymis2")

#run simulation
SIM <- simulate.multivariate(population, nsim=nsim, m=5, mis.p=.5)

#run evaluation
pooled <- evaluate.impute(SIM)

#print pooled output
finite1 <- Reduce("+", pooled$finite1) / length(pooled$finite1)
rubin1 <- Reduce("+", pooled$rubin1) / length(pooled$rubin1)
finite2 <- Reduce("+", pooled$finite2) / length(pooled$finite2)
rubin2 <- Reduce("+", pooled$rubin2) / length(pooled$rubin2)
out50 <- rbind(finite1, rubin1, finite2, rubin2)

#run evaluation Barnard & Rubin (1999)
pooledBR <- evaluate.impute.BR(SIM)

#print pooled output Barnard & Rubin (1999)
finite1BR <- Reduce("+", pooledBR$finite1) / length(pooledBR$finite1)
rubin1BR <- Reduce("+", pooledBR$rubin1) / length(pooledBR$rubin1)
finite2BR <- Reduce("+", pooledBR$finite2) / length(pooledBR$finite2)
rubin2BR <- Reduce("+", pooledBR$rubin2) / length(pooledBR$rubin2)
out50BR <- rbind(finite1BR, rubin1BR, finite2BR, rubin2BR)


save.image("Workspaces/Multivariate_sim50.RData")