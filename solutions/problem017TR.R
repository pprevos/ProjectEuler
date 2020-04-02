# Turkish number words
# Emrehan Zeybekoğlu <barla29@gmail.com>

numword.tr <- function(x) { if (x > 999999) return("Error: Oustide my vocabulary")
    # Vocabulary 
    single <- c("bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz")
    teens <- c( "on", "onbir", "oniki", "onüç", "ondört", "onbeş", "onaltı", "onyedi", "onsekiz", "ondokuz")
    tens <- c("on", "yirmi", "otuz", "kırk", "elli", "altmış", "yetmiş", "seksen", "doksan")
    # Translation
    numword.10 <- function (y) {
        a <- y %% 100
        if (a != 0) {
            if (a < 20)
                return (c(single, teens)[a])
            else
                return (c(tens[floor(a / 10)], single[a %% 10]))
        }
    }
    numword.100 <- function (y) {
        a <- (floor(y / 100) %% 100) %% 10
        if (a != 0)
            return (c(single[a], "yüz"))
    }
    numword.1000 <- function(y) {
        a <- (1000 * floor(y / 1000)) / 1000
        if (a != 0)
            return (c(numword.100(a), numword.10(a), "bin"))
    }
    numword <- paste(c(numword.1000(x), numword.100(x), numword.10(x)), collapse=" ")
    return (trimws(numword))
}

answer <- nchar(gsub(" ", "", paste0(sapply(1:1000, numword.tr), collapse="")))
print(answer)
