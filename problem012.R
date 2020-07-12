## Project Euler 12: Highly Divisible Triangular Number
i <- 0
divisors <- 0
while (divisors < 500) {
    i <- i + 1
    triangle <- (i * (i + 1)) / 2
    pf <- prime.factors(triangle)
    alpha <- rle(pf)
    divisors <- prod(alpha$lengths + 1)
}
answer <- triangle
print(answer)
