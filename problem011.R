## Project Euler 11: Largest product in a grid

square <- as.matrix(read.delim("data/p011_matrix.txt", header = FALSE, sep = " "))

prod.vert <- square[1:17, ] * square[2:18, ] * square[3:19, ] * square[4:20, ]
prod.hori <- square[ ,1:17] * square[ ,2:18] * square[ ,3:19] * square[ ,4:20]
prod.dia1 <- square[1:17, 1:17] * square[2:18, 2:18] * square[3:19, 3:19] * square[4:20, 4:20]
prod.dia2 <- square[4:20, 1:17] * square[3:19, 2:18] * square[2:18, 3:19] * square[1:17, 4:20]

answer <- max(prod.vert, prod.hori, prod.dia1, prod.dia2)
print(answer)
