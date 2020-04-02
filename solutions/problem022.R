# Problem 22: Names scores
# https://projecteuler.net/problem=22

# ETL: Read the file and converts it to an ordered vector.
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

# Most popular baby names
library(rvest)
url <- "https://www.babycenter.com/top-baby-names-2016.htm"
babynames <- url %>%
    read_html() %>%
    html_nodes(xpath = '//*[@id="babyNameList"]/table') %>%
    html_table()
babynames <- babynames[[1]]

# Convert Project Euler list and test for matches
proper <- function(x) paste0(toupper(substr(x, 1, 1)), tolower(substring(x, 2)))
names <- proper(names)

sum(babynames$GIRLS %in% names)
sum(babynames$BOYS %in% names)

babynames$GIRLS[!(babynames$GIRLS %in% names)]
babynames$BOYS[!(babynames$BOYS %in% names)]
