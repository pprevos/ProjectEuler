# German number words
# Konstantin Greger
# kogreger@gmail.com

numword.de <- function(x) { if (x > 999999) return("Error: Oustide my vocabulary")
    # Vocabulary 
    single <- c("eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun")
    teens <- c( "zehn", "elf", "zwölf", "dreizehn", "vierzehn", "fünfzehn", "sechzehn", "siebzehn", "achtzehn", "neunzehn")
    tens <- c("zehn", "zwanzig", "dreißig", "vierzig", "fünfzig", "sechzig", "siebzig", "achtzig", "neunzig")
    # Translation
    numword.10 <- function (y) {
        a <- y %% 100
        if (a != 0) {
            if (a < 20)
                return (c(single, teens)[a])
            else if (a == 21) 
                return ("ein und zwanzig")
            else
                return (c(single[a %% 10], "und", tens[floor(a / 10)]))
        }
    }
    numword.100 <- function (y) {
        a <- (floor(y / 100) %% 100) %% 10
        if (a != 0)
            if (a == 1)
                return ("ein hundert")
        else
            return (c(single[a], "hundert"))
    }
    numword.1000 <- function(y) {
        a <- (1000 * floor(y / 1000)) / 1000
        if (a == 1)
            return ("ein tausend")
        else if (a != 0)
            return (c(numword.100(a), numword.10(a), "tausend"))
    }
    numword <- paste(c(numword.1000(x), numword.100(x), numword.10(x)), collapse=" ")
    return (trimws(numword))
}

antwort <- nchar(gsub(" ", "", paste0(sapply(1:1000, numword.de), collapse="")))
print(antwort)
