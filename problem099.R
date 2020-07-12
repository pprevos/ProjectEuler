# Problem 99: Largest exponential
# https://projecteuler.net/problem=99

euler99 <- read.csv("Euler/p099_base_exp.txt", header=F)
names(euler99) <- c("base", "exponent")

# Multiple Precision Arithmetic
library(gmp)
euler99$base_big <- as.bigz(euler99$base)
euler99$power <- euler99$base_big ^ euler99$exponent
answer <- which.max(euler99$power)
print(answer)

# log(a^b) = b log(a)
euler99$log.power <- euler99$exponent * log(euler99$base)
answer <- which.max(euler99$log.power)
print(answer)

