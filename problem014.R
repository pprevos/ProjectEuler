## Project Euler 14: Longest Collatz Sequence
## Brute Force
collatz.chain <- function(n) {
    chain <- vector()
    i <- 1
    while (n != 1) {
        if (n%%2 == 0)
            n <- n / 2
        else
        n <- 3 * n + 1
        chain[i] <- n
        i <- i + 1
    }
    return(chain)
}
answer <- 0
collatz.max <- 0
for (n in 1:1E6) {
    collatz.length <- length(collatz.chain(n))
    if (collatz.length > collatz.max) {
        answer <- n
        collatz.max <- collatz.length
    }
}
print(answer)

## Optimised method
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

## Visualise
library(ggplot2)
collatz <- data.frame(n = 1:10000,
                      steps = collatz.length[1:10000])
ggplot(collatz, aes(n, steps)) +
  geom_point(size = .5, col = "darkblue") +
  theme_minimal(base_size = 10) +
  labs(title = "Collatz Sequence",
       subtitle = "Number of steps to reach 1")
ggsave("../../../../static/images/project-euler/problem-014a.png", width = 6, height = 4)

## Collatz Chains
library(igraph)
edgelist <- data.frame(a = 2, b = 1)
for (n in 3:26) {
   chain <- as.character(c(n, collatz.chain(n)))
   chain <- data.frame(a = chain[-length(chain)], b = chain[-1])
   edgelist <- rbind(edgelist, chain)
}
g <- graph.edgelist(as.matrix(edgelist))
g <- simplify(g)

png("../../../../static/images/project-euler/problem-014b.png", 
    width = 1024, height = 768)
par(mar = rep(0,4))
V(g)$color <- degree(g, mode = "out") == 0
plot(g,
     layout = layout.auto,
     vertex.color = V(g)$color,
     vertex.frame.color = NA,
     frame.color = "white",
     vertex.size = 6,
     vertex.label.cex = 1.5,
     vertex.label.color = "black",
     edge.arrow.size = 0.2,
     edge.color = "grey"
     )
 dev.off()
