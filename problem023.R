## Project Euler 23: Non-Abundant Sums
source("project-euler-021.R", verbose = FALSE)
abundant <- function(x){
    abundant <- vector()
    a <- 1
    for (n in 1:x) {
        sigma <- sum(divisors(n))
        if (sigma > 2 * n) {
            abundant[a] <- n
            a <- a + 1
        }
    }
    return(abundant)
}

abundant <- abundant(28123)
A048242 <- 1:20161
for (i in 1:length(abundant)) {
    for (j in i:length(abundant)) {
        if (abundant[i] + abundant[j] <= 20161) {
            A048242[abundant[i] + abundant[j]] <- NA
        }
    }
}
A048242 <- A048242[!is.na(A048242)]
answer <- sum(A048242)
print(answer)
