## Project Euler 10: Summation of Primes
source("problem003.R", echo = FALSE)

primes <- esieve(2e6)
answer <- sum(primes)
print(answer)

## Goldbach's Conjecture
goldbach <- function(n) {
    if (n%%2 != 0) return("This only works for even numbers")
    if (n == 2) return(0)
    primes <- rev(esieve(n)) # All primes below n
    k <- length(primes)
    g <- 0
    for (i in 1:k) {
      for (j in i:k) {
        if((primes[i] + primes[j]) == n) {
          # print(paste(n, "=", primes[i], "+", primes[j]))
          g <- g + 1
        }
      }
    }
    return(g)
  }

  library(ggplot2)
  n <- seq(from = 2, by = 2, length.out = 1000)
  A002375 <- data.frame(n,
                        g = sapply(n, goldbach))
  ggplot(A002375, aes(n, g)) +
    geom_point(col = "red", size = .5) +
    theme_minimal(base_size = 10) +
    labs(title = "Goldbach's Expressions",
         subtitle = "Number of ways to write an even number as the sum of two primes",
         x = "Even number", y = "Number of prime sums")
  ggsave("images/problem-010.png", width = 6, height = 4)
