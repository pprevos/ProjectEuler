source("Euler/euler.R")

rotate <- function (v) {
    l <- length(v)
    if (l != 1) {
        w <- (1:l) + 1
        w[w > l] <- 1
    }
    v <- v[w]
    return (v)
}

primes <- esieve(1e6)
answer <- 0

t <- proc.time()
for (n in primes) {
    digs <- as.numeric(unlist(strsplit(as.character(n), "")))
    circular.prime <- TRUE
    if (n > 9) {
    if (!any(digs %% 2 == 0)) {
        for (i in 1:(length(digs) - 1)) {
            digs <- rotate(digs)
            if (!is.prime(as.numeric(paste0(digs, collapse=""))))
                circular.prime <- FALSE
            }
    } else circular.prime <- FALSE
    }
    if (circular.prime) answer <- answer + 1
    }
print(proc.time() - t)
print(answer)
