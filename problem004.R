## Project Euler 4: Largest Palindromic Product

## Reverse a number
reverse <- function(n) {
    reverse <- 0
    while (n > 0) {
        reverse <- 10 * reverse + (n %% 10)
        n <- floor(n / 10)
    }
    return(reverse)
}

## Euler problem 4
for (i in 999:900) {
    for (j in 990:900) {
        p <- i * j
        if (p == reverse(p)) 
            break
    }
    if (p == reverse(p)) {
        break
    }
}
answer <- i * j
print(answer)

## Lychrel Numbers
lychrel <- function(l, verbose = FALSE) {
  while(l != reverse(l)) {
    l <- l + reverse(l)
    print(l)
  }
}

lychrel <- function(l) {
  while(l != reverse(l))
    l <- l + reverse(l)
  return(l)
}

## First 195 non-Lychrel numbers
options(digits = 22)
sapply(10:195, lychrel)

## This function call apparently never halts - run at your own risk!
lychrel(196)
