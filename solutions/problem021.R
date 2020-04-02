# Problem 21: Amicable numbers
# https://projecteuler.net/problem=21
# Evaluate the sum of all the amicable numbers under 10000

proper.divisors <- function(x) {
    divisors <- vector()
    d <- 1
    for (i in 1:floor(sqrt(x))) {
        if (x %% i == 0) {
            divisors[d] <- i
            if (i != x/i) {
                d <- d + 1
                divisors[d] <- x / i
            }
            d <- d + 1
        }
    }
    return(divisors)
}

answer <- 0
n <- 220
while (n <= 10000) {
    div.sum <- sum(proper.divisors(n)) - n
    if (n == sum(proper.divisors(div.sum)) - div.sum & n != div.sum) {
        answer <- answer + n + div.sum
        print(paste0("(", n, ",", div.sum, ")"))
        n <- div.sum
    }
    n <- n + 1
}
print(answer)