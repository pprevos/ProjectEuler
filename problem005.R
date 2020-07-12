## Project Euler 5: Smallest Multiple

answer <- 2520
while (sum(answer %% (1:20)) != 0) {
    answer <- answer + 2520 # Increase by smallest number divisible by 1:10
}
print(answer)

## Generalised method 

gcd = function (x, y) ifelse(x == 0, y, gcd(y %% x, x))
lcm = function (x, y) x * y / gcd(x, y)
Reduce(lcm, 1:20)
Reduce(lcm, 1:20, accumulate = TRUE)
