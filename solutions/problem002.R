## Euler Problem 2: Even Fibonacci numbers
## https://projecteuler.net/problem=2
## https://lucidmanager.org/euler-problem-2/

fib <- c(1, 2)  #Define first two numbers
while (max(fib) < 4E+06) {
    # Generate Fibonacci numbers until limit is reached
    len <- length(fib)
    fib <- c(fib, fib[len - 1] + fib[len])
}
answer <- sum(fib[fib %% 2 == 0])
print(answer)

## GNU Multiple Precision Arithmetic Library
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
