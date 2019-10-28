#adjusted pool.scalar function
pool.finite <- function (Q, U, finite = TRUE) {
  m <- length(Q)
  qbar <- mean(Q)
  ubar = 0  
  b <- var(Q)
  t <- ubar + (m + 1) * b/m
  r <- (1 + 1/m) * b/ubar
  df <- (m - 1) * (1 + 1/r)^2
  f <- (r + 2/(df + 3))/(r + 1)
  fit <- list(m = m, qhat = Q, u = U, qbar = qbar, ubar = ubar, 
              b = b, t = t, r = r, df = df, f = f)
  return(fit)
}
