## Euler Problem 3: Largest prime factor
## https://projecteuler.net/problem=3
## https://lucidmanager.org/euler-problem-3/

esieve <- function(n) {
    if (n == 1) return(NULL)
    if (n == 2) return(n)
    ## Create a list of consecutive integers {2,3,…,N}.
    l <- 2:n
    ## Start counter
    i <- 1
    ## Select p as the first prime number in the list, p=2.
    p <- 2
    while (p^2<=n) {
        ## Remove all multiples of p from the l.
        l <- l[l == p | l %% p!= 0]
        ## set p equal to the next integer in l which has not been removed.
        i <- i + 1
        ## Repeat steps 3 and 4 until p2 > n,
        ## all the remaining numbers in the list are primes
        p <- l[i]
    }
    return(l)
}

prime.factors <- function (n) {
    ## Define list of factors
    factors <- c()
    ## Define primes to be tested
    primes <- esieve(floor(sqrt(n)))
    ## Idenitfy prime divisors
    d <- which(n %% primes == 0) 
    ## No prime divisors
    if (length(d) == 0) 
        return(n)
    ## Test candidate primes
    for (q in primes[d]) {
        ## Generate list of factors
        while (n %% q == 0) {
            factors <- c(factors, q)
            n <- n/q } }
    if (n > 1) factors <- c(factors, n)
    return(factors)
}

max(prime.factors(600851475143))

## Using number package
library(numbers)
max(primeFactors(600851475143))
