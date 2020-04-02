# Problem 31: Coin sums
# https://projecteuler.net/problem=31

# https://www.youtube.com/watch?v=_fgjrs570YE

coins <- c(1, 2, 5, 1, 20, 50, 100, 200)
amount <- 200

answer <- matrix(nrow = length(coins) + 1, ncol = amount + 1)
answer[,1] <- 1
answer[1,] <- 1

for (i in 1:ncol(answer)) {
    for (j in 1:nrow(answer)) {
        print(paste(i,j))
        if (j >= coins[i]) {
            answer[i, j] <- answer[i - 1, j] + answer[i, j - coins[i]]
            }
        else {
            answer[i, j] <- answer[i - 1, j]
        }
    }
}
