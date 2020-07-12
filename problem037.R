source("Euler/euler.R")

truncable.prime <- function(p) {
    digs <- as.character(p)
    left <- sapply(1:nchar(digs), function(x) as.numeric(substr(digs, x, nchar(digs))))
    right <- sapply(nchar(digs):1, function(x) as.numeric(substr(digs, 1, x)))
    return(all(sapply(c(left, right), is.prime)))
}

p <- 11
truncable <- 0
answer <- 0
while (truncable != 11) {
    p <- p + 2
    if (is.prime(p)) {
        if (truncable.prime(p)) {
            print(p)
            truncable <- truncable + 1
            answer <- answer + p
            p <- p
        }
    }
}
print(answer)



