

# Solution:
# https://math.stackexchange.com/questions/1656686/how-many-rectangles-can-be-observed-in-the-grid


r.max <- 2E6
diff.min <- 2E6
for (m in 1:200) {
    for (n in m:200) {
        r <- (m * (m + 1) * n * (n + 1)) / 4
        print(r)
        if (abs(r.max - r) < diff.min) {
            diff.min <- abs(r.max - r)
            answer <- m * n
        }
    }
}
print(answer)

