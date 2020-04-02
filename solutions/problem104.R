# Problem 104: Pandigital Fibonacci ends

top.digits <- function(n){
        phi <- (1 + sqrt(5)) / 2
        t <- n * log10(phi) + log10(1/sqrt(5))
        t <- floor((10^(t-floor(t)) + 8))
        return(t)
    }
    
    fk <- 2
    f0 <- 1
    f1 <- 1
    
    for (fk in 1:329468){
        #while (!pandigital(f1) | !pandigital(top.digits(fk))){
        f0 <- f1
        f1 <- (f1+f0) %% 10**9
        fk <- fk + 1
        print(paste(f0, fk, f1))
        #}
    }
    
    answer <- fk
    