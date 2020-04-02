# Euler Problem 30: Digit Fifth Powers
# https://projecteuler.net/problem=30

# Find the sum of all the numbers that can be written as the 
# sum of fifth powers of their digits.

# http://r.prevos.net/digit-fifth-powers-euler-problem-30/

m <- 5
highest <- round(log10(9^m)) * 9^m
answer <- 0
for (x in 2:highest) {
    n <- 0:log10(x)
    power.sum <- sum(((1/10^n) * (x %% 10^(n + 1) - x %% 10^n))^m)
    if (power.sum == x) {
        print(x)
        answer <- answer + x
    }
}
print(answer)

## ISBN Check digit
check_isbn13 <- function(isbn) {
    isbn <- gsub(" |-", "", isbn)
    check_sum <- 0
    for (i in 1:12) {
        m <- ifelse(i %% 2 == 0, 3, 1)
        check_sum <- check_sum + m * as.numeric(substr(isbn, i, i))
    }
    check_sum <- ifelse(check_sum %% 10 == 0, 0, 10 - check_sum %% 10)
    check_sum == substr(isbn, 13, 13)
}
check_isbn13("978-0-9875669-4-2")


