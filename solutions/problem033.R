## Euler Problem 33
num <- vector()
den <- vector()
for (a in 11:99) {
    for (b in (a + 1):99) {
        trivial <- (a %% 10 == 0 | b && 10 == 0 | a %% 11 == 0 | b %% 11 == 0)
        if (!trivial) {
            i <- as.numeric(unlist(strsplit(as.character(a), "")))
            j <- as.numeric(unlist(strsplit(as.character(b), "")))
            digs <- c(i, j)
            dup <- digs[duplicated(digs)]
            digs <- digs[which(digs != dup)]
            if (length(digs) == 2 & a/b == digs[1]/digs[2]) {
                num <- c(num, a)
                den <- c(den, b)
                }
        }
    }
}
paste(num, den, sep = "/")
answer <- prod(den) / prod(num)
print(answer)

## Farey Sequence
farey <- function(n) {
    fseq <- list()
    fseq[[1]] <- c(0, 1)
    i <- 2
    gcd <- function(a, b) { # Euclid's method
        if (a == 0) return(b)
        if (b == 0) return(a)
        gcd(b, a%%b)
    }
    for (q in 2:n) {
        for (p in 1:(q - 1)){
            if (gcd(p, q) == 1) {
                fseq[[i]] <- c(p, q)
                i <- i + 1
                }
        }
    }
    fseq[[i]] <- c(1, 1)
    fseq <- as.data.frame(do.call(rbind, fseq))
    names(fseq) <- c("p", "q")
    fseq <- fseq[order(fseq$p / fseq$q), ]
    return(fseq)
}

## Ford Circles
library(tidyverse)
lm_palette <- c("#008da1", "#005395", "#262e43", "#3b2758", "#865596", "#f26230")
ford_circles <- farey(20) %>%
    mutate(x = p / q,
           y = 1 / (2* q^2),
           r = y,
           c = lm_palette[(q - 1)%%6 + 1])

g_circle <- function(r, x, y, color = NA, fill = "black", ...) {
    x <- x + r * cos(seq(0, pi, length.out = 100))
    ymax <- y + r * sin(seq(0, pi, length.out = 100))
    ymin <- y + r * sin(seq(0, -pi, length.out = 100))
    annotate("ribbon", x = x, ymin = ymin, ymax = ymax,
             color = color, fill = fill, ...)
}

p <- ggplot(ford_circles, aes(x, y))
for (i in 1:nrow(ford_circles)) {
    p <- p + g_circle(ford_circles$r[i], ford_circles$x[i], ford_circles$y[i],
                      fill = ford_circles$c[i])
}
p + xlim(c(0, 1)) + coord_fixed() + theme_void()
ggsave("Images/FordCircles.png", dpi = 300)
