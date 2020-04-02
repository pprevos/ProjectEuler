options(digits = 22)
a <- 3
b <- 7
r <- 0
s <- 1 
limit <- 1E6 

for (q in limit:2) {
    p <- floor((a * q - 1) / b)
    if ((p * s) > (r * q)) {
        s <- q
        r <- p
    }
}
print(paste(r, s, sep = "/"))
