# Problem 25: 1000-digit Fibonacci number
# https://projecteuler.net/problem=25

# Using the GNU Multiple Precision Arithmetic Library
library(gmp) 
t <- proc.time()
n <- 1
fib <- 1
while (nchar(as.character(fib)) < 1000) {
    fib <- fibnum(n) # Determine next Fibonacci number
    n <- n + 1
}
answer <- n
print(answer)
print(proc.time()-t)

# Base R Solution
source("ProjectEuler/euler.R")
t <- proc.time()
fib <- 1 # First Fibonaci number
cur <- 1 # Current number in sequence
pre <- 1 # Previous number in sequence
index <- 2
while (nchar(fib) < 1000) {
    fib <- big.add(cur, pre) # Determine next Fibonacci number
    pre <- cur
    cur <- fib
    index <- index + 1
}
answer <- index
print(answer)
print(proc.time()-t)
