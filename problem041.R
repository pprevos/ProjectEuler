source("Euler/euler.R")

# Check for pandigital
pandigital <- function(x) {
    digs <- as.numeric(unlist(strsplit(as.character(p), "")))
    return(all(digs[order(digs)] == 1:length(digs)))
}

# Start with highest possible pandigital number
p <- 7654321 # http://www.mathblog.dk/project-euler-41-pandigital-prime/

#p <- 987654321
while (!is.prime(p) | !pandigital(p)) {
    p <- p - 2
}
answer <- p
print(answer)

