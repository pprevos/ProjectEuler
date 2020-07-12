source("Euler/euler.R")

# GMP library
library(gmp)
self.power <- as.bigz(0)
for (i in 1:1000) {
    self.power <- self.power + (as.bigz(i)^as.bigz(i))
}
print(self.power)
answer <- as.character(self.power)
answer <- substr(answer, nchar(answer) - 9 , nchar(answer))
print(answer)

# Homwbew slow method
self.power <- 0
for (i in 1:1000) {
    self.power <- big.add(self.power, Reduce(big.mult, rep(i, i)))
}
answer <- unlist(strsplit(as.character(self.power), split = ""))
answer <- paste(answer[(length(answer) - 9):length(answer)], collapse = "")
print(answer)

(1:13)^2
