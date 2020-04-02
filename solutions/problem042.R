words <- read.delim("https://projecteuler.net/project/resources/p042_words.txt", sep = ",")
words <- names(words)
words <- gsub("[[:punct:]]", "", words)

w.sum <- sapply(words, function(w) {
    chars <- unlist(strsplit(w, ""))
    numbs <- sapply(chars, function(l) which(LETTERS %in% l))
    sum(numbs)
})

n <- 1:20
triangle <- (n / 2) * (n + 1)

answer <- length(unlist(sapply(triangle, function(t) w.sum[w.sum==t])))
print(answer)
