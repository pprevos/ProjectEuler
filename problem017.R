## Project Euler 17: Number Letter Counts
numword.en <- function(x) {
    if (x > 999999) return("Error: Oustide my vocabulary")
    # Vocabulary 
    single <- c("one", "two", "three", "four", "five", "six", "seven", "eight", "nine")
    teens <- c( "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen")
    tens <- c("ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety")
    numword.10 <- function (y) {
        a <- y %% 100
        if (a != 0) {
            and <- ifelse(y > 100, "and", "")
            if (a < 20)
                return (c(and, c(single, teens)[a]))
            else
                return (c(and, tens[floor(a / 10)], single[a %% 10]))
        }
    }
    numword.100 <- function (y) {
        a <- (floor(y / 100) %% 100) %% 10
        if (a != 0)
            return (c(single[a], "hundred"))
    }
    numword.1000 <- function(y) {
        a <- (1000 * floor(y / 1000)) / 1000
        if (a != 0)
            return (c(numword.100(a), numword.10(a), "thousand"))
    }
    numword <- paste(c(numword.1000(x), numword.100(x), numword.10(x)), collapse=" ")
    return (trimws(numword))
}

answer <- nchar(gsub(" ", "", paste0(sapply(1:1000, numword.en), collapse="")))
print(answer)

## Nederlandse nummers
numword.nl <- function(x) {
    if (x > 999999) return("Error: Getal te hoog.")
    single <- c("een", "twee", "drie", "vier", "vijf", "zes", "zeven", "acht", "negen")
    teens <- c( "tien", "elf", "twaalf", "dertien", "veertien", "vijftien", "zestien", "zeventien", "achtien", "negentien")
    tens <- c("tien", "twintig", "dertig", "veertig", "vijftig", "zestig", "zeventig", "tachtig", "negengtig")
    numword.10 <- function(y) {
        a <- y %% 100
        if (a != 0) {
            if (a < 20)
                return (c(single, teens)[a])
            else
                return (c(single[a %% 10], "en", tens[floor(a / 10)]))
        }
    }
    numword.100 <- function(y) {
        a <- (floor(y / 100) %% 100) %% 10
        if (a == 1)
            return ("honderd")
        if (a > 1) 
            return (c(single[a], "honderd"))
    }
    numword.1000 <- function(y) {
        a <- (1000 * floor(y / 1000)) / 1000
        if (a == 1)
            return ("duizend ")
        if (a > 0)
            return (c(numword.100(a), numword.10(a), "duizend "))
    }
    numword<- paste(c(numword.1000(x), numword.100(x), numword.10(x)), collapse="")
    return (trimws(numword))
}

antwoord <- nchar(gsub(" ", "", paste0(sapply(1:1000, numword.nl), collapse="")))
print(antwoord)
