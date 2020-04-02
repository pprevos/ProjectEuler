## Problem 10: Summation of primes
## https://lucidmanager.org/euler-problem-10/

source("euler.R")

primes <- esieve(2E6)
answer <- sum(as.numeric(primes))
print(answer)





