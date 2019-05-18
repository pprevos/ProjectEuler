## Problem 28: Number spiral diagonals
## https://projecteuler.net/problem=28

source("euler.R")

size <- 1001 # Size of matrix
answer <- 1 # Starting number
## Define corners of subsequent matrices
for (n in seq(from = 3, to = size, by = 2)) {
    corners <- seq(from = n * (n - 3) + 3, by = n - 1, length.out = 4)
    answer <- answer + sum(corners)
}
print(answer)

## Ulam Spiral
size <- 101 ## Size of matrix
ulam <- matrix(ncol = size, nrow = size)
mid <- floor(size / 2 + 1)
ulam[mid, mid] <- 1
for (n in seq(from = 3, to = size, by = 2)) {
    numbers <- (n * (n - 4) + 5) : ((n + 2) * ((n + 2) - 4) + 4)
    d <- mid - floor(n / 2)
    l <- length(numbers)
    ulam[d, d:(d + n - 1)] <- numbers[(l - n + 1):l]
    ulam[d + n - 1, (d + n - 1):d] <- numbers[(n - 1):(n - 2 + n)]
    ulam[(d + 1):(d + n - 2), d] <- numbers[(l - n):(l - 2 * n + 3)]
    ulam[(d + 1):(d + n - 2), d + n - 1] <- numbers[1:(n - 2)]
}
ulam.primes <- apply(ulam, c(1, 2), is.prime)

## Visualise
library(tidyverse)
library(reshape2)
ulam <- melt(ulam.primes, varnames = c("x", "y"), value.name = "prime")
ggplot(ulam, aes(x = x, y = y, fill = prime)) +
    geom_raster() + 
    scale_fill_manual(values = c("lightgrey", "dodgerblue4")) + 
    theme_void()

ggsave("ProjectEuler/Images/problem028l.png", dpi = 300)

## Find prime number diagonals

ulam.diagonals <- ulam.primes * 1

for (i in 1:nrow(ulam.diagonals)) {
    for (j in 1:ncol(ulam.diagonals)) {
        a <- i - 1
        if (a < 0) a <- 0
        if (a > nrow(ulam.diagonals)) a <- nrow(ulam.diagonals)
        b <- j - 1
        if (b < 0) b <- 0
        if (b > nrow(ulam.diagonals)) b <- nrow(ulam.diagonals)
        
    }
}

matrix(ulam.diagonals[a:(a + 2), b:(b +2)], ncol = 3)



