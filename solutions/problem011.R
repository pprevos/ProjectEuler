## Problem 11: Largest product in a grid
## https://projecteuler.net/problem=11
## https://lucidmanager.org/euler-problem-11/

## Read and convert data
square <- readLines("Data/p011_matrix.txt")
square <- as.numeric(unlist(lapply(square, function(x){strsplit(x, " ")})))
square <- matrix(square, ncol = 20)

## Define products
prod.vert <- square[1:17, ] * square[2:18, ] * square[3:19, ] * square[4:20, ]
prod.hori <- square[,1:17] * square[,2:18] * square[,3:19] * square[,4:20]
prod.dia1 <- square[1:17, 1:17] * square[2:18, 2:18] * square[3:19, 3:19] * square[4:20, 4:20]
prod.dia2 <- square[4:20, 1:17] * square[3:19, 2:18] * square[2:18, 3:19] * square[1:17, 4:20]

answer <- max(prod.vert, prod.hori, prod.dia1, prod.dia2)
print(answer)

## Alternative by Robert D. Brown III and PP
N <- 4
cols <- ncol(square)
answer <- max(c(apply(sapply(1:N, function(n) square[n:(cols - N + n), ]), 1, prod), 
                apply(sapply(1:N, function(n) square[, n:(cols - N + n)]), 1, prod),
                apply(sapply(1:N, function(n) square[n:(cols - N + n), n:(cols - N + n)]), 1, prod),
                apply(sapply(1:N, function(n) square[(N - n + 1):(cols - n + 1), n:(cols - N + n)]), 1, prod)
))
print(answer)
