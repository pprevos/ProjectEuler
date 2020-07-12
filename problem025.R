## Project Euler 25: Fibonacci number with 1000 digits
## GNU Multiple Precision Arithmetic Library
 library(gmp) 
 answer <- 1
 fib <- 1
 while (nchar(as.character(fib)) <= 1000) {
     fib <- fibnum(answer) # Determine next Fibonacci number
     answer <- answer + 1
 }
 print(answer)

## Base-R Solution
fib <- 1 # First Fibonaci number
cur <- 1 # Current number in sequence
pre <- 1 # Previous number in sequence
answer <- 2
while (nchar(fib) < 1000) {
    fib <- big.add(cur, pre) # Determine next Fibonacci number
    pre <- cur
    cur <- fib
    answer <- answer + 1
}
print(answer)
