# Euler Problem 57
# Square root convergents
# See also problem 65

t <- proc.time()
library(gmp)
n <- as.vector(as.bigz(3))
d <- as.vector(as.bigz(2))

for (k in 2:1000) {
n[k] <- n[k - 1] + 2 * d[k - 1]
d[k] <- n[k - 1] + d[k - 1]
}

answer <- sum(floor(log10.bigz(n)) > floor(log10.bigz(d)))
print(proc.time() - t)
