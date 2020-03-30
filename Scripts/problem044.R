
p.max <- 3000
n <- 1:p.max

Pn <- n * (3 * n - 1) / 2

for (j in 1:p.max) {
    for (k in (j + 1):p.max) {
        if ((Pn[j] + Pn[k]) %in% Pn & (Pn[k] - Pn[j]) %in% Pn) {
            D <- Pn[k] - Pn[j]
            break
        }
    }
}
cat(paste("j = ", j, "\nk = ", k))
cat(paste("D = ", D))
