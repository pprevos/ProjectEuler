# Consecutive prime sum
# Problem 50

source("Euler/euler.R")

target <- 1E6
p <- esieve(target)
l.mx <- 1
for (i in 1:(length(p) - 1)) {
    for (j in (i + 1):length(p)) {
        p.sm <- sum(p[i:j])
        if (p.sm > target) break
        if (is.prime(p.sm) & (j - i + 1) > l.mx) {
            l.mx <- j - i + 1
            p.mx <- p.sm
        }
    }
}
answer <- p.mx
print(paste0(answer, " (", l.mx, ")"))
