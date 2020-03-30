# Problem 20: Factorial digit sum
# https://projecteuler.net/problem=20

# Standard function
digits <- factorial(100)
answer <- sum(as.numeric(unlist(strsplit(as.character(digits), ""))), na.rm = TRUE)
print(answer)

# Using Reduce
fact <- 1
x <- 100
for (i in 2:x) {
    fact <- Reduce("+", rep(fact, i))
}
print(fact)

# GMP
library(gmp)
t <- proc.time()
digits <- factorialZ(100)
answer <- sum(as.numeric(unlist(strsplit(as.character(digits), ""))))
print(answer)
print(proc.time() - t)

# Base-R
source("ProjectEuler/euler.R")
big.factorial <- function(x) {
    bf <- 1
    if (x > 1) {
        for (i in 2:x) {
            bf <- Reduce(big.add, rep(bf,i))
        }
    }
    return (bf)
}

t <- proc.time()
digits <- big.factorial(100)
answer <- sum(as.numeric(unlist(strsplit(as.character(digits), ""))))
print(answer)
print(proc.time() - t)

