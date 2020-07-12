## Project Euler 2: Sum of Even Fibonacci Numbers

## Recursive function
fib <- function(n) {
    if (n <= 2) return(1)
    return(fib(n - 1) + fib(n - 2))
}
fib(32)

## Sequential function
fib <- c(1, 2)
while (max(fib) < 4E+06) {
    len <- length(fib)
    fib <- c(fib, fib[len - 1] + fib[len])
}
answer <- sum(fib[fib %% 2 == 0])
print(answer)

library(gmp)
i <- 1
answer <- 0
fib <- fibnum(i)
while (fib <= 4E6) {
    if (fib %% 2 == 0) {
        answer <- answer + fib
        }
    i <- i + 1
    fib <- fibnum(i)
    }
print(answer)
