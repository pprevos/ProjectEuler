# Euler Problem 39: Integer right triangles
# https://projecteuler.net/problem=39

solution.max <- 0
for (p in 12:1000) {
    solution <- 0
    for (a in 1:floor(p / 3)) {
        for (b in (a + 1):(p / 2)) {
            c <- p - a - b
            if (c > 0 & a^2 + b^2 == c^2) {
                solution <- solution + 1
                print(paste(p, a, b, c))
            }
        }
    }
    if (solution > solution.max) {
        answer <- p
        solution.max <- solution
        }
}
print(answer)
