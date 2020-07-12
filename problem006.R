## Project Euler 6: Sum square difference
answer <- sum(1:100)^2 - sum((1:100)^2)
print(answer)

n <- 100
answer <- ((n * (n + 1)) / 2)^2 - (n * (n + 1) * (2 * n + 1)) / 6
print(answer)
