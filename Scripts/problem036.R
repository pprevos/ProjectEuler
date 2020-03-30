# Problem 36: Double-base palindromes
# https://projecteuler.net/problem=36

source("Euler/euler.R")

# Convert decimal to binary
binary <- function(x) {
    if (all(x<2)) x 
    else paste(binary(x%/%2), x%%2, sep="") 
}

answer <- 0
for (i in 1:1e6) {
    if (palindrome(i) & palindrome(binary(i))) 
        answer <- answer + i
}

answer
