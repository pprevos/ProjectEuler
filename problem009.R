## Problem 9: Special Pythagorean triplet
## https://projecteuler.net/problem=9
## https://r.prevos.net/euler-problem-9/

## Brute force
t <- proc.time()
a <- 0; b <- 0; c<- 0
s <- 1000
found <- FALSE
for (a in 1:floor((s/3))) {
    for (b in a:(s/2)) {
        c <- s - a - b
        if (a^2 + b^2 == c^2) {
            found <- TRUE
            break
        }
    }
    if (found) break
}
answer <- a * b * c
print(answer)
print(proc.time() - t)

## Improved Brute Force
t <- proc.time()
a <- 1
b <- 499
repeat{
    c <- sqrt(a^2 + b^2)
    if (a + b + c > 1000) {b <- b - 1}
    else if (a + b + c < 1000) {a <- a + 1}
    else if (a + b + c == 1000) {break}
}
answer <- a * b * c
print(answer)
print(proc.time()-t)

## Euclid's Formula 
t <- proc.time()
abcsum <- 1000 						
x <- abcsum / 2
min <- floor(sqrt(x / 2))
max <- ceiling(sqrt(x))
m <- min:max
m <- m[x %% m == 0] 
n < -((x / m) - m)
a <- 2 * m * n
b <- m^2 - n^2
c <- m^2 + n^2
answer <- a * b * c
print(answer)
print(proc.time() - t)
