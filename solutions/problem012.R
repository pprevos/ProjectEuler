## Problem 12: Highly divisible triangular number
## https://projecteuler.net/problem=12

## Prime factorisation function
source("euler.R")

## generate triangle numbers and count prime factors
t <- proc.time()
i <- 1
divisors <- 0
while (divisors < 500) {
    i <- i + 1
    triangle <- (i * (i + 1)) / 2
    alpha <- rle(prime.factors(triangle))
    divisors <- prod(alpha$lengths + 1)
}
answer <- triangle
print(answer)
print(proc.time() - t)


