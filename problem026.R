# Problem 26: Reciprocal cycles
# https://projecteuler.net/problem=26

recur <- function(x, output = "") {
    # Prepare variable
    if (x == 0) return(NaN)
    if (x == 1) return(0)
    x <- floor(abs(x))
    # Initiate vectors to store decimals and remainders
    dec <- vector()
    rem <- vector()
    # Initiate values
    i <- 1
    r <- 10
    rem <- r
    # Long division
    repeat {
        dec[i] <- floor(r / x)
        r <- 10 * (r %% x)
        # Test wether the number is terminating or repeating
        if (r == 0 | r %in% rem) break
        rem[i + 1] <- r
        i <- i + 1 
    }
    # Determine number of recurring digits
    rep <- ifelse(r != 0, length(rem) - which(r == rem) + 1, 0)
    # Output
    if (output == "len")
        return(rep)
    else {
        if (rep != 0) {
            if (rep == length(dec)) 
                l <- "("
            else
                l <- c(dec[1:(length(dec) - rep)], "(")
            dec <- c(l, dec[(length(dec) - rep + 1):length(dec)], ")")
        }
        return(paste0("0.", paste0(dec, collapse = "", sep = "")))
        }
}

A051626 <- sapply(1:1000, recur, "len")
answer <- which.max(A051626)
print(answer)

recur(998001, "len")
recur(998001)
