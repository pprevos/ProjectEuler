# Problem 89: Roman numerals
# https://projecteuler.net/problem=89

library(stringr)

roman.decimal <- function(roman) {
    d <- 0
    I <- substr(roman, str_locate(roman, "I")[1], nchar(roman))
    if (!is.na(I)) {
        if (is.na(str_locate(I, "V")[1]) & is.na(str_locate(I, "X")[1])) {
            d <- nchar(I)
            } else {
                if (!is.na(str_locate(I, "V")[1])) d <- nchar(I)+5-3
                if (!is.na(str_locate(I, "X")[1])) d <- nchar(I)+10-3
            }
        roman <- gsub(I, "", roman)
        }
    
    V <- substr(roman, str_locate(roman, "V")[1], nchar(roman))
    if (!is.na(V)) {
        d <- d + 5
        roman <- gsub("V", "", roman)
    }
    
    X <- substr(roman, str_locate(roman, "X")[1], nchar(roman))
    if (!is.na(X)) {
        if (is.na(str_locate(X, "L")[1]) & is.na(str_locate(X, "C")[1])) {
            d <- d + nchar(X) * 10
        } else {
            if (!is.na(str_locate(X, "L")[1])) d <- d + 10*nchar(X)+50-30
            if (!is.na(str_locate(X, "C")[1])) d <- d + 10*nchar(X)+100-30
        }
        roman <- gsub(X, "", roman)
    }

    L <- substr(roman, str_locate(roman, "L")[1], nchar(roman))
    if (!is.na(L)) {
        d <- d + 50
        roman <- gsub("L", "", roman)
    }

    C <- substr(roman, str_locate(roman, "C")[1], nchar(roman))
    if (!is.na(C)) {
        if (is.na(str_locate(C, "D")[1]) & is.na(str_locate(C, "M")[1])) {
            d <- d + nchar(C) * 100
        } else {
            if (!is.na(str_locate(C, "D")[1])) d <- d + 100*nchar(C)+500-300
            if (!is.na(str_locate(C, "M")[1])) d <- d + 100*nchar(C)+1000-300
        }
        roman <- gsub(C, "", roman)
    }    

    D <- substr(roman, str_locate(roman, "D")[1], nchar(roman))
    if (!is.na(D)) {
        d <- d + 500
        roman <- gsub("D", "", roman)
    }
    M <- substr(roman, str_locate(roman, "M")[1], nchar(roman))
    if (!is.na(M))
        d <- d + nchar(M) * 1000
    return(d)
}

decimal.roman <- function(decimal) {
    #if (decimal>3999) return("Number too large")
    M <- paste0(rep("M" , floor(decimal/1000)), collapse="")
    decimal <- decimal%%1000
    if (decimal>=500) D <- "D" else D <- ""
    decimal <- decimal%%500
    C <- paste0(rep("C" , floor(decimal/100)), collapse="")
    if (nchar(C)==4) {
        C <- ""
        ifelse(D=="D", D <- "CM", D <- "CD")
    }
    decimal <- decimal%%100
    if (decimal>=50) L <- "L" else L <- ""
    decimal <- decimal%%50
    X <- paste0(rep("X" , floor(decimal/10)), collapse="")
    if (nchar(X)==4) {
        X <- ""
        ifelse(L=="L", L <- "XC", L <- "XL")
    }
    decimal <- decimal%%10
    if (decimal>=5) V <- "V" else V <- ""
    decimal <- decimal%%5
    I <- paste0(rep("I" , decimal), collapse="")
    if (nchar(I)==4) {
        I <- ""
        ifelse(V=="V", V <- "IX", V <- "IV")
    }
    return(paste0(M, D, C, L, X, V, I))
}

roman.long <- readLines("Euler/p089_roman.txt", warn=FALSE)
# Convert to decimals
decimal <- unlist(lapply(roman.long, roman.decimal))
# Convert back to Roman
roman <- unlist(lapply(decimal, decimal.roman))
# Compare length
answer <- sum(nchar(roman.long) - nchar(roman))
print(answer)

