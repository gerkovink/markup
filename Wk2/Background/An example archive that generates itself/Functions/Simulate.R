#bivariate data simulation function
simulate.bivariate <-function(data, nsim, m=5, method = "norm"){
  OUT <- list(NA)
  pb <- txtProgressBar(min = 0, max = nsim, style = 3)
  for(i in 1:nsim){
    mis <- data
    #make missing
    mis[rbinom(nrow(data), 1, .5)==1, 2] <- NA #MCAR
    #impute data
    OUT[[i]] <- mice(mis, m=m, meth=method, print=F)
    setTxtProgressBar(pb, i)
  }
  close(pb)  
  return(OUT)
}

#multivariate data simulation function
simulate.multivariate <-function(data, nsim, m=5, mis.p = .5, method = "norm"){
  OUT <- list(NA)
  pb <- txtProgressBar(min = 0, max = nsim, style = 3)
  for(i in 1:nsim){
    mis <- data
    #make missing
    for(q in 2: ncol(data)){
      mis[rbinom(nrow(data), 1, mis.p)==1, q] <- NA #MCAR  
    }
    #avoid multicollinearity issues (when only a few joint observed)
    while(!is.na(cor(mis, use = "pairwise.complete.obs")[2,3]) & abs(cor(mis, use = "pairwise.complete.obs")[2,3]) > .99){
      mis <- data
      #make missing
      for(z in 2: ncol(data)){
        mis[rbinom(nrow(data), 1, mis.p)==1, z] <- NA #MCAR  
      }
    }
    #impute data
    OUT[[i]] <- mice(mis, m=m, maxit=10, meth=method, print=F)
    setTxtProgressBar(pb, i)
  }
  close(pb)  
  return(OUT)
}

# #old multivariate simulation function
# simulate.multivariate <-function(data, nsim, m=5, mis.p = .5, method = "norm"){
#   OUT <- list(NA)
#   pb <- txtProgressBar(min = 0, max = nsim, style = 3)
#   for(i in 1:nsim){
#     mis <- data
#     #make missing
#     for(q in 2: ncol(data)){
#       mis[rbinom(nrow(data), 1, mis.p)==1, q] <- NA #MCAR  
#     }
#     #impute data
#     OUT[[i]] <- mice(mis, m=m, maxit=5, meth=method, print=F)
#     setTxtProgressBar(pb, i)
#   }
#   close(pb)  
#   return(OUT)
# }