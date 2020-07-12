## Project Euler 7: 10,0001st Prime Number
source("problem003.R", echo = FALSE)
is.prime <- function(n) {
    if (n <= 1) return(FALSE)
    if (n == 2) return(TRUE)
    primes <- esieve(ceiling(sqrt(n)))
    return(prod(n %% primes != 0) == 1)
}

answer <- 1
n <- 1 # Start counter
while (n < 10001) { # Find 10001 prime numbers
    answer <- answer + 2 # Next number
    if(is.prime(answer)) { 
        n <- n + 1 # Increment counter
    }
}
print(answer)

## Sexy Primes
library(ggplot2)
library(dplyr)

primes <- esieve(answer)
p <- length(primes)
gaps <- tibble(Gap = primes[2:p] - primes[1:(p - 1)],
                   Sexy = Gap %% 6 == 0) %>%
    count(Gap, Sexy)

ggplot(gaps, aes(factor(Gap), n, fill = Sexy)) +
    geom_col() +
    scale_fill_manual(values = c( "#7391AB", "#A62102"), name = "Sexy Prime Gap") +
    theme_minimal(base_size = 10) + 
    labs(title = "Frequency of prime gaps for the first 10,000 primes",
        x = "Prime Gap",
        y = "Frequency")
        guide_legend(title = "Sexy Primes")

ggsave("images/problem-007.png", width = 6, height = 4)
