# Problem 38: Pandigital multiples
# https://projecteuler.net/problem=38

pandigital9 <- function(x) { # Test if string is 9-pandigital
    x <- unlist(strsplit(as.character(x), ""))
    return(length(x)==9 & !any(duplicated(x)) & !"0" %in% x)
}


answer <- 0
for (m in 9999:1) {
    for (n in 9:2) {
        number <- as.numeric(paste0(m * (1:n), collapse=""))
        if (pandigital9(number)) {
            if (number > answer) answer <- number
                }
        }
    }
}
