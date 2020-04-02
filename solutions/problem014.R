## Euler Problem 14: Longest Collatz sequence
## https://projecteuler.net/problem=14
## https://r.prevos.net/euler-problem-14-collatz-sequence/

library(tidyverse)
collatz.chain <- function(n) {
    chain <- vector()
    i <- 1
    while (n != 1) {
        if (n %% 2 == 0)
            n <- n / 2
        else
            n <- 3 * n + 1
        chain[i] <- n
        i <- i + 1
    }
    return(chain)
}

collatz.length <- vector(length = 1E6)
collatz.length[1] <- 0
for (n in 2:1E6) {
    x <- n
    count <- 0
    while (x != 1 & x >= n) {
        if (x %% 2 == 0) {
            x <- x / 2
            count <- count + 1
        }
        else {
            x <- (3 * x + 1) / 2
            count <- count + 2
        } 
    }
    count <- count + collatz.length[x]
    collatz.length[n] <- count
}

answer <- which.max(collatz.length)
print(answer)

## Collatz Network
library(igraph)
edgelist <- data.frame(a = 2, b = 1)
for (n in 3:26) {
   chain <- as.character(c(n, collatz.chain(n)))
   chain <- data.frame(a = chain[-length(chain)], b = chain[-1])
   edgelist <- rbind(edgelist, chain)
}
g <- graph.edgelist(as.matrix(edgelist))
g <- simplify(g)
par(mar = rep(0,4))
V(g)$color <- degree(g, mode = "out") + 1
plot(g, 
     layout = layout.kamada.kawai,
     vertex.color = V(g)$color, 
     vertex.size = 6,
     vertex.label.cex = 0.7,
     vertex.label.color = "black",
     edge.arrow.size = 0.1,
     edge.color = "black"
     )
