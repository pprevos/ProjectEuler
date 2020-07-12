## Project Euler 20: Factorial Digit Sum
library(gmp)
digits <- factorialZ(100)
digits <- as.character(digits)
answer <- sum(as.numeric(unlist(strsplit(digits, ""))))
print(answer)

## Base-R Code
fact <- 1
x <- 100
for (i in 2:x) {
    fact <- Reduce("+", rep(fact, i))
}
print(fact)

source("problem013.R", echo = FALSE)
big.factorial <- function(x) {
    x <- floor(x)
    bf <- 1
    if (x > 1) {
        for (i in 2:x) {
            bf <- Reduce(big.add, rep(bf,i))
        }
    }
return (bf)
}

digits <- big.factorial(100)
answer <- sum(as.numeric(unlist(strsplit(as.character(digits), ""))))
print(answer)
