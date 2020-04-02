# Permuted multiples
# Problem 52 

permuted.multiples <- function(n, l) {
    chars <- function(p) {
        d <- as.character(n * p)
        d <- unlist(strsplit(d, split = ""))
        d <- d[order(d)]
        paste(d, collapse = "")
    }
    permutes <- sapply(1:l, chars)
    all(permutes %in% permutes[1])
}

permuted.multiples(125874, 2)

answer <- 0
n <- 1
while (answer == 0) {
    if (permuted.multiples(n, 6)) answer <- n
    n <- n + 1
}
print(answer)



    
