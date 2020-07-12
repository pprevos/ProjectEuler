## Investigating multiple reflections of a laser beam
## Problem 144
## https://r.prevos.net/euler-problem-144/

plot_ellipse <- function(a, b, colour = NA, line = "black") {
    plot.new()
    plot.window(xlim = c(-a, a), ylim = c(-b, b), asp = 1)
    par(mar = rep(0,4))
    x <- seq(-a, a, length = 200)
    y <- sqrt(b^2 - (b^2 / a^2) * x^2)
    lines(x, y, col = line)
    lines(x, -y, col = line)
    polygon(x, y, col = colour, border = NA)
    polygon(x, -y, col = colour, border = NA)
}

bounce <- function(coords) {
    x <- coords$x
    y <- coords$y
    ## Tangent to ellipse
    t <- -(b^2 / a^2) * (x[2] / y[2])
    ## Deflection on sloping mirror y = mx + c
    dydx <- diff(y) / diff(x)
    m <- tan(pi - atan(dydx) + 2 * atan(t))
    c <- y[2] - m * x[2]
    ## Determine intersection point
    ## Source: http://www.ambrsoft.com/TrigoCalc/Circles2/Ellipse/EllipseLine.htm
    x[1] <- x[2]
    y[1] <- y[2]
    x2 <- (-a^2 * m * c + c(-1, 1) * (a * b * sqrt(a^2 * m^2 + b^2 - c^2))) /
          (a^2 * m^2 + b^2)
    x[2] <- ifelse(round(x[1] / x2[1], 6) == 1, x2[2], x2[1])
    y[2] <- m * x[2] + c
    return(data.frame(x, y))
}

# Initial conditions
a <- 5
b <- 10
x1 <- 0
y1 <- 10.1
x2 <- 1.4
y2 <- -9.6
answer <- 0
plot_ellipse(a, b)
points(c(0,0), c(-c, c), pch = 19)
## Bounce laser breams
laser <- data.frame(x = c(x1, x2), y = c(y1, y2))
while((laser$x[2] < -0.01 | laser$x[2] > 0.01) | laser$y[2] < 0) { ## Escape?
    lines(laser$x, laser$y, col = "red", lwd = .5)
    laser <- bounce(laser)
    answer <- answer + 1
}
print(answer)

## Elliptical pool table
## https://www.youtube.com/watch?time_continue=54&v=4KHCuXN2F3I
e <- 0.43
a <- 130
b <- a * sqrt((1 + e) * (1 - e)) # a > b
f <- sqrt(a^2 - b^2)
plot_ellipse(a, b, "darkgreen", NA)
points(-f, 0, pch = 19, cex = 2)
points(f, 0, pch = 19, col = "grey")

## Simulate random shot
angle <- runif(1, 0, 2 * pi)
x1 <- runif(1, -a, a)
ymax <- sqrt(b^2 - (b^2 / a^2) * x1^2)
y1 <- runif(1, -ymax, ymax)

## First shot
m <- tan(angle)
c <- y1 - m * x1
x2 <- (-a^2 * m * c + c(-1, 1) * (a * b * sqrt(a^2 * m^2 + b^2 - c^2))) / (a^2 * m^2 + b^2)
y2 <- m * x2 + c
x2 <- x2[which(((x2 - x1) < 0) == (cos(angle) < 0))]
y2 <- y2[which(((y2 - y1) < 0) == (sin(angle) < 0))]
shot <- (data.frame(x = c(x1, x2), y = c(y1, y2)))

## Bounce ball
for (i in 1:100){
    dydx <- diff(shot$y) / diff(shot$x)
    if (all.equal(dydx, (shot$y[1] - 0) / (shot$x[1] - -f)) == TRUE) {
        shot[2, ] <- c(-f, 0)
    }
    lines(shot$x, shot$y, col = "yellow", lwd = 1)
    if (shot[2,2] == 0) break
    shot <- bounce(shot)
}
points(x1, y1, pch = 19, col = "blue", cex = 1.8)
