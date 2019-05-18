# Problem 55: Lychrel numbers
# https://projecteuler.net/problem=55

source("Euler/euler.R")

lychrel <- function(x) {
    n <- 1
    repeat {
        digs <- as.character(x)
        reverse <- paste(rev(unlist(strsplit(digs, ""))), collapse = "")
        x <- big.add(x, reverse)
        n <- n + 1
        if (palindrome(x) | n > 50) break
    }
    return(!palindrome(x))
}

answer <- 0
for (n in 1:10000) {
    if (lychrel(n)) {
        answer <- answer+1
    }
}
print(answer)

