## Project Euler 22: Names Scores
names <- readLines("https://projecteuler.net/project/resources/p022_names.txt",
                   warn =FALSE)
names <- unlist(strsplit(names, ","))
names <- gsub("[[:punct:]]", "", names)
names <- sort(names)

# Total Name scores
answer <- 0
for (i in names) {
    value <- sum(sapply(unlist(strsplit(i, "")),
                 function(x) as.numeric(charToRaw(x)) - 64))
    value <- value * which(names==i)
    answer <- answer + value
}
print(answer)
