## Probelm 13: Large Sum
## https://projecteuler.net/problem=13
## https://r.prevos.net/euler-problem-13/

library(gmp)
numbers <- readLines("Data/p013_numbers.txt")

gmp_method <- function() {
    digits <- sum(as.bigz(numbers))
    answer <- substr(as.character(digits),1,10)
    return(answer)
    }

## Add numbers with many digits
big.add <- function(a, b) {
    ## Add leading zeros to smallest number
    if (nchar(a)<nchar(b)) 
        a <- paste0(paste(rep(0, nchar(b) - nchar(a)), collapse = ""), a)
    if (nchar(a)>nchar(b)) 
        b <- paste0(paste(rep(0, nchar(a) - nchar(b)), collapse = ""), b)
    solution <- vector()
    remainder <- 0
    for (i in nchar(b):1) {
        p <- as.numeric(substr(a, i, i))
        q <- as.numeric(substr(b, i, i))
        r <- p + q + remainder
        if (r >= 10 & i != 1) {
            solution <- c(solution, r %% 10)
            remainder <- (r - (r %% 10)) / 10
        } else {
            solution <- c(solution, r)
            remainder <- 0
        }
    }
    return(paste(rev(solution), collapse = ""))
}

base_method <- function() {
    answer <- 0
    for (i in numbers)
        answer <- big.add(answer, i)
    answer <- substr(answer, 1, 10)
    return(answer)
}

## Benchmarking
library(microbenchmark)
library(ggplot2)
tm <- microbenchmark(gmp_method(), base_method())
autoplot(tm)


