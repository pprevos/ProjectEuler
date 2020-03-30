source("Euler/euler.R")

goldbach2 <- TRUE
n <- 3
while (goldbach2 != FALSE) {
    if (!is.prime(n)) {
        test <- sqrt((n - esieve(n)) / 2)
        if (!any(test == floor(test)))
            goldbach2 <- FALSE
    }
    n <- n + 2
}
answer <- n - 2
print(answer)






