#load required packages
require(mice)
require(MASS)

#load simulation/evaluation functions
source("Functions/Simulate.R")
source("Functions/Pool.finite.R")
source("Functions/Evaluate.impute.multiv.R")
source("Functions/Evaluate.impute.multiv.B&R1999.R") #Barnard and Rubin (1999) df rules used

#simulation parameters
populationsize = 1000
nsim = 10000

#execute respective scripts
source("Simulation conditions/Simulation_multivariate 10.R")
source("Simulation conditions/Simulation_multivariate 20.R")
source("Simulation conditions/Simulation_multivariate 30.R")
source("Simulation conditions/Simulation_multivariate 40.R")
source("Simulation conditions/Simulation_multivariate 50.R")
source("Simulation conditions/Simulation_multivariate 60.R")
source("Simulation conditions/Simulation_multivariate 70.R")
source("Simulation conditions/Simulation_multivariate 80.R")
source("Simulation conditions/Simulation_multivariate 90.R")
source("Simulation conditions/Simulation_multivariate 95.R")

rm(SIM)

save.image("Workspaces/Simulation_Multivariate.RData")
