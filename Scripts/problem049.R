t <- proc.time()

source("Euler/euler.R")

primes <- esieve(9999)
primes <- primes[primes>1487]
l <- length(primes)

is.perm <- function(a,b) {
    a <- unlist(strsplit(unique(as.character(a)), ""))
    b <- unlist(strsplit(unique(as.character(b)), ""))
    prod(a[order(a)] == b[order(b)])==1
}

answer <- 0
for (i in 1:(l-1)) {
    a <- primes[i]
    for (j in (i+1):l) {
        b <- primes[j]
        if (is.perm(a, b)){
            c <- b + (b - a)
            if (c < 10000)
                if (c %in% primes & is.perm(b,c)) {
                    answer <- (paste0(a,b,c))
                    break
                    }
        }
        if (answer != 0) break
    }
    
}
print(answer)
print(proc.time()-t)
