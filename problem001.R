## Project Euler 1: Multiples of 3 and 5

## Solution 1
answer <- 0
for (i in 1:999) {
    if (i %% 3 == 0 | i %% 5 == 0) 
        answer <- answer + i
}
print(answer)

## Solution 2
sum((1:999)[((1:999) %% 3 == 0) | ((1:999) %% 5 == 0)])

## Solution 3
sum(unique(c(seq(3, 999, 3), seq(5, 999, 5))))

## Solution 4
SumDivBy <- function(m, n) {
    p <- floor(n / m) * m # Round to multiple of n
    return (p * (1 + (p / m)) / 2)
}
SumDivBy(3, 999) + SumDivBy(5, 999) - SumDivBy(15, 999)
