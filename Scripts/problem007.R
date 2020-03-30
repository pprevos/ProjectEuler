## Euler Problem 7: 10,001st Prime
## https://lucidmanager.org/euler-problem-7/

source("euler.R") ## Project Euler functions

is.prime <- function(n) {
    primes <- esieve(ceiling(sqrt(n)))
    prod(n %% primes != 0) == 1
}

i <- 2 # First Prime
n <- 1 # Start counter
while (n < 10001) { # Find 10001 prime numbers
    i <- i + 1 # Next number
    if(is.prime(i)) { # Test next number
        n <- n + 1 # Increment counter
        i <- i + 1 # Next prime is at least two away
    }
}
answer <- i - 1
print(answer)

## Visualise prime gaps
library(tidyverse)
primes <- esieve(i)
p <- length(primes)
gaps <- data_frame(Gap = primes[2:p] - primes[1:(p - 1)],
                   Sexy = Gap %% 6 == 0) %>%
    group_by(Gap, Sexy) %>%
    count()

ggplot(gaps, aes(Gap, n, fill = Sexy)) +
    geom_col() +
    scale_fill_manual(values = c( "#7391AB", "#A62102")) +
    labs(title = "Frequency of prime gaps for the first 10,000 primes",
         x = "Prime Gap",
         y = "Frequency") 
guide_legend(title = "Sexy Prime")

ggsave("Images/problem007.png", dpi = 300)


