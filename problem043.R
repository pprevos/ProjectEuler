getPerms <- function(x) {
    if (length(x) == 1) {
        return(x)
    }
    else {
        res <- matrix(nrow = 0, ncol = length(x))
        for (i in seq_along(x)) {
            res <- rbind(res, cbind(x[i], Recall(x[-i])))
        }
        return(res)
    }
}

answer <- 0
pandigital <- getPerms(0:9)
primes <- c(2, 3, 5, 7, 11, 13, 17)
p <- vector(length = 7)
for (i in 1:nrow(pandigital)) {
    for (j in 2:8) {
        p[j - 1] <- as.numeric(paste(pandigital[i, j:(j + 2)], collapse = ""))
    }
    if (all(p %% primes == 0)) {
        print (pandigital[i,])
        answer <- answer + as.numeric(paste(pandigital[i,], collapse = ""))
    }
}
print(answer)


