

t <- proc.time()
n <- 1:100000
triangle <- n * (n + 1) / 2
pentagonal <- n * (3 * n - 1) / 2
hexagonal <- n * (2 * n - 1)
answer <- triangle[which(triangle %in% pentagonal & triangle %in% hexagonal)]
answer <- answer[which(answer > 40755)]
print(answer)
print(proc.time() - t)

t <- proc.time()
answer <- 0
n <- 285
while (answer < 40755) {
    n <- n +1
    triangle <- n * (n + 1) / 2
    pentagonal <- (1:n) * (3 * (1:n) - 1) / 2
    hexagonal <- (1:n) * (2 * (1:n) - 1)
    answer <- c(0, triangle[which(triangle %in% pentagonal & triangle %in% hexagonal)])
}
print(proc.time() - t)

t <- proc.time()
answer <- 0
n <- 285
pentagonal <- (1:n) * (3 * (1:n) - 1) / 2
hexagonal <- (1:n) * (2 * (1:n) - 1)
while (answer < 40755) {
    n <- n +1
    triangle <- n * (n + 1) / 2
    pentagonal[n] <- n * (3 * n - 1) / 2
    hexagonal[n] <- n * (2 * n - 1)
    answer <- c(0, triangle[which(triangle %in% pentagonal & triangle %in% hexagonal)])
}
print(proc.time() - t)
