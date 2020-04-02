# Cyclical figurate numbers
# Problem 61

# Generate polygonal numbers
n <- 1:140 # Max p3n = 9999
polygonal <- matrix(nrow = max(n), ncol = 6)
polygonal[, 1] <- n * (n + 1) / 2
polygonal[, 2] <- n * n
polygonal[, 3] <- n * (3 * n - 1 ) / 2
polygonal[, 4] <- n * (2 * n - 1)
polygonal[, 5] <- n * (5 * n - 3) / 2
polygonal[, 6] <- n * (3 * n - 2)
# Keep only 4-digit numbers
polygonal[polygonal < 1000 | polygonal > 9999] <- NA

floor(polygonal[, 1] / 100) %in% polygonal

(1:13)^2
