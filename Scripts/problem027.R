# Euler Problem 27: Quadratic primes
# https://projecteuler.net/problem=27

# http://r.prevos.net/quadratic-primes-euler-problem-27/

source("euler.R")

t <- proc.time()
seq.a <- seq(-999, 1001, 2) # a has to be odd
seq.b <- (esieve(1000)) # b has to be prime
max.count <- 0
for (a in seq.a) {
    if (a == 2) seq.a <- seq(-1000, 1000, 2) # a has to be even
    for (b in seq.b) {
        n <- 0 # Find sequence of primes for a and b
        while (is.prime(n^2 + a * n + b)) {
            n <- n + 1
        }
        # Store maximum values
        if (n > max.count) {
            max.count <- n
            max.a <- a
            max.b <- b
        }
    }
}
answer <- max.a * max.b
print(answer)
print(proc.time() - t)




