# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

answer <- 0
for (n in 3:999999) {
    digs <- as.numeric(unlist(strsplit(as.character(n), "")))
    if (sum(factorial(digs)) == n) answer <- answer + n
}
print(answer)

