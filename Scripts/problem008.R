## Euler Problem 8: Largest product in a series
## https://projecteuler.net/problem=8
## https://r.prevos.net/euler-problem-8/

library(rvest)
digits <- read_html("https://projecteuler.net/problem=8") %>%
    html_nodes("p") %>%
    html_text() 
digits <- gsub("[^0-9\\.]", "", digits[2])

ngram <- 13 # Define length
answer <- 0
## Clycle through digits
for (i in 1:(nchar(digits) - ngram + 1)) {
    ## Pick 13 consecutive digits
    adjecent <- substr(digits, i, i + ngram - 1)
    ## Define product
    mult <- prod(as.numeric(unlist(strsplit(adjecent, ""))))
    ## Largest?
    if (mult > answer) answer <- mult
}
print(answer)
