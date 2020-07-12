# Problem 65

library(gmp)
upperbound <- 100
d <- as.bigz(1)
n <- as.bigz(2)
for (i in 2:upperbound) {
    temp <- d
    if (i %% 3 == 0) c <- 2 * (i / 3) else c <- 1
    d <- n
    n <- c * d + temp
    print(n)
}
digits <- strsplit(as.character(n), split = "")
sum(as.numeric(unlist(digits)))
