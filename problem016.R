## Project Euler 16: Power digit sum
library(gmp)
digits <- as.bigz(2^1000) # Define number
answer <- sum(as.numeric(unlist(strsplit(as.character(digits), ""))))
print(answer)

## Base-R Method
source("problem013.R", echo = FALSE)
pow <- 2
for (i in 2:1000)
    pow <- big.add(pow, pow)
answer <- sum(as.numeric(unlist(strsplit(pow, ""))))
print(answer)
