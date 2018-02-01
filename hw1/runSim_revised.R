## parsing command arguments
for (arg in commandArgs(TRUE)) {
  eval(parse(text=arg))
}

## check if a given integer is prime
isPrime <- function(n) {
  if (n <= 3) {
    return (TRUE)
  }
  if (any((n %% 2:floor(sqrt(n))) == 0)) {
    return (FALSE)
  }
  return (TRUE)
}


## estimate mean only using observation with prime indices
estMeanPrimes <- function (x) {
  n <- length(x)
  ind <- sapply(1:n, isPrime)
  return (mean(x[ind]))
}


mse_function <- function(seed, n, distr, rep){
  
  set.seed(seed)
  trueMean = 0
  
  classic_mean <- vector()
  prime_mean <- vector()
  
  
  for (i in 1:rep){
    
    if(distr == "gaussian") {
      x <- rnorm(n)
      
      
    } else if (distr == "t1"){
      x <- rt(n, df=1)
      
      
    } else if (distr == "t5"){
      x <- rt(n, df=5)
      
    }
    classic_mean[i] <- mean(x)
    prime_mean[i] <- estMeanPrimes(x)
  }
  mse_prime <- sum(prime_mean^2 - trueMean) / rep
  mse_classic <- sum(classic_mean^2 - trueMean) / rep
  return(c(mse_prime, mse_classic))
}



mse <- mse_function(seed, n, distr, rep)
mse