## Problem 16: Power digit sum
## https://projecteuler.net/problem=16

t<- proc.time()
library(gmp)
digits <- as.bigz(2^1000) # Define number
answer <- unlist(strsplit(as.character(digits), ""))
answer <- sum(as.numeric(answer))
print(answer)
print(proc.time()-t)

source("euler.R")

t <- proc.time()
pow <- 2
big.mult <- function(a, b) Reduce(big.add, rep(a, as.numeric(b)))
pow <- Reduce(big.mult, rep(pow, 1000))
answer <- sum(as.numeric(unlist(strsplit(pow, ""))))
print(answer)
print(proc.time()-t)

t <- proc.time()
## Raise 2 to the power 1000
pow <- 2
for (i in 2:1000)
    pow <- big.add(pow, pow)
## Sum all digits
answer <- sum(as.numeric(unlist(strsplit(pow, ""))))
print(answer)
print(proc.time()-t)
