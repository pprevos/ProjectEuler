## Functions for Project Euler problems

## Determine proper divisors
divisors <- function(x) {
    divisors <- vector()
    d <- 1
    for (i in 1:floor(sqrt(x))) {
        if (x %% i == 0) {
            divisors[d] <- i
            if (i != x / i) {
                d <- d + 1
                divisors[d] <- x / i
            }
            d <- d + 1
        }
    }
    return(divisors)
}

## Sum all numbers divisible by n between 1 and m
SumDivBy <- function(n, m) {
    p <- floor(m / n) * n # Round to multiple of n
    return (n * (p / n) * (1 + (p / n)) / 2)
}

## Sieve of Eratosthenes for generating primes 2:n
esieve <- function(n) {
    if (n == 1) return(NULL)
    if (n == 2) return(n)
    # Create a list l of consecutive integers {2,3,…,N}.
    l <- 2:n
    # Start counter
    i <- 1
    # Select p as the first prime number in the list, p=2.
    p <- 2
    while (p^2 <= n) {
        # Remove all multiples of p from the l.
        l <- l[l == p | l %% p != 0]
        # set p equal to the next integer in l which has not been removed.
        i <- i + 1
        # Repeat steps 3 and 4 until p2 > n, all the remaining numbers in the list are primes
        p <- l[i]
    }
    return(l)
}

## Prime Factors
prime.factors <- function (n) {
    factors <- c() # Define list of factors
    primes <- esieve(floor(sqrt(n))) # Define primes to be tested
    d <- which(n %% primes == 0) # Idenitfy prime divisors
    if (length(d) == 0) # No prime divisors
        return(n)
    for (q in primes[d]) { # Test candidate primes
        while (n %% q == 0) { # Generate list of factors
            factors <- c(factors, q)
            n <- n/q
        }
    }
    if (n > 1) factors <- c(factors, n)
    return(factors)
}

## Check for palindromic number
palindrome <- function(x) {
    # Convert to character
    word <- as.character(x)
    # Create reverse
    reverse <- paste(rev(unlist(strsplit(word, ""))), collapse = "")
    # Check whether palindrome
    return(word == reverse)
}

## Check for primality
is.prime <- function(n) {
    if (n <= 1) return (FALSE)
    if (n == 2) return (TRUE)
    else {
        primes <- esieve(ceiling(sqrt(n))) # Idenitfy prime divisors
        return (all(n%%primes !=0 )) # Check for divisibility
    }
}

# Add numbers with many digits
big.add <- function(a, b) {
    if (nchar(a)<nchar(b)) 
        a <- paste0(paste(rep(0, nchar(b)-nchar(a)), collapse=""), a)
    if (nchar(a)>nchar(b)) 
        b <- paste0(paste(rep(0, nchar(a) - nchar(b)), collapse = ""), b)
    solution <- vector()
    remainder <- 0
    for (i in nchar(b):1) {
        p <- as.numeric(substr(a, i, i))
        q <- as.numeric(substr(b, i, i))
        r <- p + q + remainder
        if (r >= 10 & i!=1) {
            solution <- c(solution, r %% 10)
            remainder <- (r - (r %% 10)) / 10
        } else {
            solution <- c(solution, r)
            remainder <- 0
        }
    }
    return(paste(rev(solution), collapse=""))
}

# Multiply a very large number with a regular integer
big.mult <- function(a, b) {
    Reduce(big.add, rep(a, as.numeric(b)))
}

# Convert decimal to binary
binary <- function(x) {
    if (all(x < 2)) x 
    else paste(binary(x %/% 2), x %% 2, sep = "") 
}


