# Problem 47: Distinct Prime Factors
# https://projecteuler.net/problem=47

source("Euler/euler.R")

t <- proc.time()
l <- 4
found <- FALSE
i <- 1
while (found == FALSE) {
    pf <- unlist(lapply(i:(i + l - 1), 
                 function(x) length(unique(prime.factors(x)))))
    if (all(pf == l)) 
        found <- TRUE
    i <- ifelse (any(pf[-1]==l), 
                 i + min(which(pf[-1]==l)), 
                 i + 4
                 )
}
answer <- i - 1
print(answer)
print(proc.time() - t)


    
