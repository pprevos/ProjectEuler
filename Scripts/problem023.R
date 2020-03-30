# Problem 23: Non-abundant sums
# https://projecteuler.net/problem=23

source("ProjectEuler/euler.R")

# 12 is the smallest abundant number
# All integers greater than 20161 can be written as the sum of two abundant numbers

# Generate abundant numbers (OEIS A005101)
A005101 <- function(x){
    abundant <- vector()
    a <- 1
    for (n in 1:x) {
        aliquot.sum <- sum(divisors(n)) - n
        if (aliquot.sum > n) {
            abundant[a] <- n
            a <- a + 1
        }
    }
    return(abundant)
}

abundant <- A005101(28123)

# Create a list of potential numbers that are not the sum of two abundant numbers
A048242 <- 1:20161

# Remove any number that is the sum of two abundant numbers
for (i in 1:length(abundant)) {
    for (j in i:length(abundant)) {
        if (abundant[i] + abundant[j] <= 20161) {
            A048242[abundant[i] + abundant[j]] <- NA
        }
    }
}
A048242 <- A048242[!is.na(A048242)]
answer <- sum(A048242)
print(answer)






