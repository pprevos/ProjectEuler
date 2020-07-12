## Project Euler 27: Quadratic Primes
source("problem007.R", verbose = FALSE)

seq.a <- seq(-999, 1001, 2) # a has to be odd
seq.b <- (esieve(1000)) # b has to be prime
max.n <- 0

for (a in seq.a) {
  for (b in seq.b) {
    n <- 0 # Find sequence of primes for a and b
    while (is.prime(n^2 + a * n + b)) {
      n <- n + 1
    }
    ## Store maximum values
    if (n > max.n) {
      max.n <- n
      max.a <- a
      max.b <- b
    }
  }
}

answer <- max.a * max.b
print(answer)

## Test the answer
n <- 0:(max.count - 1)
sapply(n^2 + max.a * n + max.b, is.prime)
