# Euler Probel 58: 
# Same as Problem 28

source("Euler/euler.R")

t <- proc.time()
size <- 3
ratio <- 1
primes <- 0
while (ratio >= 0.1) {
    corners <- seq(from = size * (size - 3) + 3, by = size - 1, length.out = 4)
    primes <- primes + sum(sapply(corners, is.prime))
    ratio <- primes /  (2 * size - 1)
    size <- size + 2
}
answer <- size
print(answer)
print(proc.time() - t)