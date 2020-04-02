# Path sum: two ways
# Problem 81

m81 <- c(131, 673, 234, 103, 18, 
         201, 96, 342, 965, 150, 
         630, 803, 746, 422, 111,
         537, 699, 497, 121, 956, 
         805, 732, 524, 37, 331)
m81 <- matrix(m81, ncol = 5, byrow = TRUE)

#m81 <- read.csv("https://projecteuler.net/project/resources/p081_matrix.txt", header = FALSE)
#matrixm81 <- as.matrix(m81, ncol = 80)

n <- ncol(m81)

for (i in 1:n) {
    for (j in 1:n) {
        if (i * j > 0)
            m81[i, j] <- min(m81[i - 1, j], m81[i, j - 1])
        else
            m81[i - 1, j]
    }
}

path.sum2 <- function(square) {
    for (rij in nrow(square):2) {
        for (kol in 1:(ncol(square) - 1)) {
            square[rij - 1, kol] <- square[rij - 1, kol] + min(square[kol - 1, rij], square[kol, rij - 1])
        }
        square[rij,] <- NA
    }
    print(square)
    return(max(square, na.rm = TRUE))
}
path.sum2(m81)
