## Project Euler 24: Lexicographic permutations
nextPerm <- function(a) {
    # Find longest non-increasing suffix
    i <- length(a)
    while (i > 1 && a[i - 1] >= a[i])
        i <- i - 1
    # i is the head index of the suffix
    # Are we at the last permutation?
    if (i <= 1) return (NA)
    # a[i - 1] is the pivot
    # Frind rightmost element that exceeds the pivot
    j <- length(a)
    while (a[j] <= a[i - 1]) 
        j <- j - 1
    # Swap pivot with j
    temp <- a[i - 1]
    a[i - 1] <- a[j]
    a[j] <- temp
    # Reverse the suffix
    a[i:length(a)] <- rev(a[i:length(a)])
    return(a)
    }

numbers <- 0:9
for (i in 1:(1E6 - 1)) numbers <- nextPerm(numbers)
answer <- paste(numbers, collapse = "")
print(answer)

numbers <- 0:9
n <- length(numbers)
answer <- vector(length = 10)
remain <- 1E6 - 1
for (i in 1:n) {
    j <- floor(remain / factorial(n - i))
    answer[i] <- numbers[j + 1]
    remain <- remain %% factorial(n - i)
    numbers <- numbers[-(j + 1)]
}
answer <- paste(answer, collapse = "")
print(answer)
