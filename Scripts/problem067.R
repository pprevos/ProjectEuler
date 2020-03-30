# Problem 67
# https://projecteuler.net/problem=67

path.sum <- function(triangle) {
    for (rij in nrow(triangle):2) {
        for (kol in 1:(ncol(triangle)-1)) {
            triangle[rij-1,kol] <- max(triangle[rij,kol:(kol+1)]) + triangle[rij-1, kol]
        }
        triangle[rij,] <- NA
    }
    return(max(triangle, na.rm = TRUE))
}

triangle.file <- read.delim("https://projecteuler.net/project/resources/p067_triangle.txt", stringsAsFactors=F, header=F)
triangle.67 <- matrix(nrow=100, ncol=100)
for (i in 1:100) {
    triangle.67[i,1:i] <- as.numeric(unlist(strsplit(triangle.file[i,], " ")))
}
answer <- path.sum(triangle.67)
print(answer)
