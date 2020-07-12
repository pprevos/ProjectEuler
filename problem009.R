## Project Euler 9: Special Pythagorean Triplet
a <- 0
b <- 0
c <- 0
s <- 1000
found <- FALSE
for (a in 1:floor((s / 3))) {
    for (b in (a + 1):floor(s / 2)) {
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

# Improved Brute Force
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

## Euclid's Method
abc_sum <- 1000
x <- abc_sum / 2
min <- floor(sqrt(x / 2))
max <- ceiling(sqrt(x))
m <- min:max
m <- m[x %% m == 0]
n <- ((x / m) - m)
a <- 2 * m * n
b <- m^2 - n^2
c <- m^2 + n^2
answer <- a * b * c
print(answer)
