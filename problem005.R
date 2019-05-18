## Euler Problem 5: Smallest Multiple
## https://projecteuler.net/problem=5
## https://lucidmanager.org/euler-problem-5/

i <- 2520
while (sum(i %% (1:20)) != 0) {
    i <- i + 2520
}
answer <- i
print(answer)

## Analytical solution by David Radcliffe
## Euclidean algorithm
gcd = function (x, y) ifelse(x == 0, y, gcd(y %% x, x))
lcm = function (x, y) x * y / gcd(x, y)
print(Reduce(lcm, 1:20))
