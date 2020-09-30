#evaluation function
evaluate.impute <- function(OUT, truth1 = population$ymis1, truth2 = population$ymis2){
  POOL1 <- list(NA)
  POOL.FIN1 <- list(NA)
  POOL2 <- list(NA)
  POOL.FIN2 <- list(NA)
  pb <- txtProgressBar(min = 0, max = length(OUT), style = 3)
  #extract pooled imputation information
  for (z in 1: length(OUT)){
    #VARIABLE 1
    #Extract means and variances
    Q            <- unlist(with(OUT[[z]], mean(ymis1))$analyses)
    U            <- unlist(with(OUT[[z]], var(ymis1))$analyses) / nrow(OUT[[z]]$data)
    #Pool the `finite'-way ;-)
    pool.fin         <- pool.finite(Q, U)
    pool.fin$lower   <- pool.fin$qbar - qt(.975, pool.fin$df) * sqrt(pool.fin$t)
    pool.fin$upper   <- pool.fin$qbar + qt(.975, pool.fin$df) * sqrt(pool.fin$t)
    pool.fin$coverage <- pool.fin$lower <= mean(truth1) & mean(truth1) <= pool.fin$upper
    POOL.FIN1[[z]]     <- unlist(pool.fin)
    #Pool the regular way
    pool         <- pool.scalar(Q, U)
    pool$lower   <- pool$qbar - qt(.975, pool$df) * sqrt(pool$t)
    pool$upper   <- pool$qbar + qt(.975, pool$df) * sqrt(pool$t)
    pool$coverage <- pool$lower <= mean(truth1) & mean(truth1) <= pool$upper
    POOL1[[z]]     <- unlist(pool)
    
    #VARIABLE 2
    #Extract means and variances
    Q            <- unlist(with(OUT[[z]], mean(ymis2))$analyses)
    U            <- unlist(with(OUT[[z]], var(ymis2))$analyses) / nrow(OUT[[z]]$data)
    #Pool the `finite'-way ;-)
    pool.fin         <- pool.finite(Q, U)
    pool.fin$lower   <- pool.fin$qbar - qt(.975, pool.fin$df) * sqrt(pool.fin$t)
    pool.fin$upper   <- pool.fin$qbar + qt(.975, pool.fin$df) * sqrt(pool.fin$t)
    pool.fin$coverage <- pool.fin$lower <= mean(truth2) & mean(truth2) <= pool.fin$upper
    POOL.FIN2[[z]]     <- unlist(pool.fin)
    #Pool the regular way
    pool         <- pool.scalar(Q, U)
    pool$lower   <- pool$qbar - qt(.975, pool$df) * sqrt(pool$t)
    pool$upper   <- pool$qbar + qt(.975, pool$df) * sqrt(pool$t)
    pool$coverage <- pool$lower <= mean(truth2) & mean(truth2) <= pool$upper
    POOL2[[z]]     <- unlist(pool)
    setTxtProgressBar(pb, z)
  }
  close(pb)  
  return(list("finite1" = POOL.FIN1, "finite2" = POOL.FIN2, "rubin1" = POOL1, "rubin2" = POOL2))
}