# Problem 84: Monopoly odds
# https://projecteuler.net/problem=84

monopoly <- data.frame(square=0:39, hits=0) # Define board

square <- 0 # Starting position
double <- 0 # Double rolls
cc <- 0 # Community Chest
ch <- 0 # Chance

for (i in 1:1E6) {
    die1 <- sample(1:4, 1); die2 <- sample(1:4, 1) # roll dice
    if (die1 == die2) # Check for doubles
        double <- double + 1 # ANother double
    if (double == 3) { # Three doubles?
        square <= 10 # Go to jail
        double <- 0 # Reset double counter
    } else {
        square <- (square + die1 + die2) %% 40 # Move on board
        if (square == 30) square <- 10 # Go to jail
        if (square %in% c(7, 22, 36)) {  # Chance
            ch <- (ch + 1) %% 16 # Pick next card
            if (ch < 6) square <- c(0, 10, 11, 24, 39, 5)[ch+1]
            if (ch == 6 | ch == 7) {
                if (square == 7) square <- 15
                if (square == 22) square <- 25
                if (square == 36) square <- 5
            }
            if (ch == 8) {
                if (square == 7) square <- 12
                if (square == 22) square <- 28
                if (square == 36) square <- 12
            }
            if (ch == 9) square <- square - 3
        }
        if (square %in% c(2, 17, 33)) { # Communit Chest
            cc <- (cc+1) %% 16 # Pick next card
            if (cc < 2) square <- c(0, 10)[cc+1]
        }
    }
    monopoly$hits[square + 1] <- monopoly$hits[square + 1] + 1
}

monopoly$hits <- 100*(monopoly$hits/sum(monopoly$hits))

barplot(monopoly$hits, names.arg=monopoly$square)
abline(h=2.5, col="red")

monopoly <- monopoly[order(monopoly$hits, decreasing=T),]

answer <- paste0(formatC(monopoly$square[1:3], width=2, flag="0"), collapse="")

print(answer)
