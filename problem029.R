# Euler Problem 29: Distinct Powers
# https://projecteuler.net/problem=29

t <- proc.time()
# Initialisation
target <- 100
terms <- vector()
i <- 1
# Loop through values of a and b and store powers in vector
for (a in 2:target) {
    for (b in 2:target) {
        terms[i] <- a^b
        i <- i + 1
        }
}
# Determine the number of distinct powers
answer <- length(unique(terms))
print(answer)
print(proc.time()-t)

t <- proc.time()
length(unique(as.vector(outer(2:100, 2:100, FUN = "^"))))
print(proc.time()-t)
