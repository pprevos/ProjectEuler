# Combinatoric selections
# Problem 53 

ncr <- function(n, r) {
    if (r <= n)
        factorial(n) / (factorial(r) * factorial(n - r))
    else
        NULL
}
ncr(5, 3)
ncr(23, 10)

answer <- 0
for (n in 1:100) {
    for (r in 1:n) {
        if (ncr(n, r) > 1E6) answer <- answer + 1
    }
}
print(answer)
