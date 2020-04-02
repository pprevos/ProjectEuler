## Euler Problem 32
## https://projecteuler.net/problem=32

pandigital.9 <- function(x) # Test if string is 9-pandigital
    (length(x)==9 & sum(duplicated(x))==0 & sum(x==0)==0)

pandigital.prod <- vector()
i <- 1
for (m in 2:100) {
    if (m < 10) n_start <- 1234 else n_start <- 123
    for (n in n_start:round(10000 / m)) {
        # List of digits
        digs <- as.numeric(unlist(strsplit(paste0(m, n, m * n), "")))
        # is Pandigital?
        if (pandigital.9(digs)) {
            pandigital.prod[i] <- m * n
            i <- i + 1
            print(paste(m, "*", n, "=", m * n))
        }
    }
}
answer <- sum(unique(pandigital.prod))
print(answer)

largest <- 6 * 9^5
answer <- 0
for (n in 2:largest) {
    power.sum <- 0
    i <- n
    while (i > 0) {
        d <- i %% 10
        i <- floor(i / 10)
        power.sum <- power.sum + d^5
    }
    if (power.sum == n) {
        answer <- answer + n
    }
}
print(answer)
