


answer <- 28433*2^7830457+1
print(answer)
.Machine$double.xmax

library(gmp)
two <- as.bigz(2)
answer <- 28433 * two^7830457 + 1


answer <- (as.character(answer))
l <- nchar(answer)
substr(answer, l-9, l)


as.bigz( 1e3091000 ) == as.bigz( 1e309 )
?as.bigz
