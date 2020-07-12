## Project Euler 28: Number Spiral Diagonals
size <- 1001 # Size of matrix
answer <- 1 # Starting number

## Define corners of subsequent matrices
for (n in seq(from = 3, to = size, by = 2)) {
    corners <- seq(from = n * (n - 3) + 3, by = n - 1, length.out = 4)
    answer <- answer + sum(corners)
}
print(answer)

## Prime Spirals
source("problem007.R", verbose = FALSE)
size <- 201 # Size of matrix
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

library(ggplot2)
library(reshape2)
ulam.primes <- melt(ulam.primes)

ggplot(ulam.primes, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile() +
    scale_fill_manual(values = c("white", "black")) +
    guides(fill = FALSE) +
    theme_void()
ggsave("images/problem-028.png", widt = 6, height = 4)
