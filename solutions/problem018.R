# Problem 18
# https://projecteuler.net/problem=18

path.sum <- function(triangle) {
    for (rij in nrow(triangle):2) {
        for (kol in 1:(ncol(triangle)-1)) {
            triangle[rij - 1,kol] <- max(triangle[rij,kol:(kol + 1)]) + triangle[rij - 1, kol]
        }
        triangle[rij,] <- NA
    }
    return(max(triangle, na.rm = TRUE))
}

triangle <- matrix(ncol = 15, nrow = 15)
triangle[1,1] <- 75
triangle[2,1:2] <- c(95, 64)
triangle[3,1:3] <- c(17, 47, 82)
triangle[4,1:4] <- c(18, 35, 87, 10)
triangle[5,1:5] <- c(20, 04, 82, 47, 65)
triangle[6,1:6] <- c(19, 01, 23, 75, 03, 34)
triangle[7,1:7] <- c(88, 02, 77, 73, 07, 63, 67)
triangle[8,1:8] <- c(99, 65, 04, 28, 06, 16, 70, 92)
triangle[9,1:9] <- c(41, 41, 26, 56, 83, 40, 80, 70, 33)
triangle[10,1:10] <- c(41, 48, 72, 33, 47, 32, 37, 16, 94, 29)
triangle[11,1:11] <- c(53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14)
triangle[12,1:12] <- c(70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57)
triangle[13,1:13] <- c(91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48)
triangle[14,1:14] <- c(63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31)
triangle[15,1:15] <- c(04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23)

answer <- path.sum(triangle)
print(answer)



# Set triangle size
size <- 8
# Create matrix
triangle <- matrix(ncol = size, nrow = size)
# Fill triangle
t.start <- function(r) { # Starting number for each row
    if (r <= 1) 
        return(r)
    else
        return(t.start(r - 1) + (r - 2) + 1)
}
# Fill triangle
for (r in 1:size) {
    i <- t.start(r)
    j <- t.start(r + 1) - 1
    triangle[r, 1:r] <- i:j
}

answer <- path.sum(triangle)
print(answer)

# Simple method
# Set triangle size
size <- 80
# Create matrix
triangle <- matrix(ncol = size, nrow = size)
# Fill triangle
triangle[1, 1] <- 1
for (r in 2:size) {
    i <- max(triangle[r - 1,], na.rm = TRUE) + 1
    j <- max(triangle[r - 1,], na.rm = TRUE) + r
    triangle[r, 1:r] <- i:j
}


