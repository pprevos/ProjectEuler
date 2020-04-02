# Euler Problem 40: Champernowne's constant
# https://projecteuler.net/problem=40

champ.len <- 200000
champ <- 1:champ.len
champ <- paste(champ, collapse = "")
d <- function(n) {
    as.numeric(substr(champ, n, n))
}
answer <- d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)
print(answer)

