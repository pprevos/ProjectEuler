## Euler Problem 6: Sum Square Difference
## https://projecteuler.net/problem=6
## https://lucidmanager.org/euler-problem-6/

## Brute force
n <- 100
answer <- sum(1:n)^2 - sum((1:n)^2)
print(answer)

## Analytical
answer <- ((n * (n + 1)) / 2)^2 - (n * (n + 1) * (2 * n + 1)) / 6
print(answer)
