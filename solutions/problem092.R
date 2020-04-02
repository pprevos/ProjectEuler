
target <- 10^7
square.digits.end <- vector(length=target)
for (n in 1:target) {
    x <- n
    while (x != 1 & x != 89) {
        v <- 0
        while (x > 0) {
            i <- x %% 10
            v <- v + i * i
            x <- floor(x/10)
        }
        x <- v
    }
    square.digits.end[n] <- x
}
answer <- sum(square.digits.end == 89)
print(answer)
answer/n*10^7
