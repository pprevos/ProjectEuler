## Project Euler 19: Counting Sundays

## Base-R
dates <- seq.Date(as.Date("1901-01-01"), as.Date("2000-12-31"), "days")
days <- rep(1:7, length.out = length(dates))
answer <- sum(days[substr(dates, 9, 10) == "01"] == 1)
print(answer)

## Using Lubridate
library(lubridate)
dates <- seq.Date(as.Date("1901-01-01"), as.Date("2000-12-31"), "months")
answer <- sum(wday(dates) == 1)
print(answer)

## Calculate from scratch
week.day <- 0
answer <- 0
for (y in 1901:2000) {
    for (m in 1:12) {
        max.day <- 31
        if (m %in% c(4, 6, 9, 11))
            max.day <- 30
        # Leap years
        if (m == 2) {
            if (y %% 4 == 0 & y %% 100 != 0 | y %% 400 == 0) 
                max.day <- 29
            else 
                max.day <- 28
        }
        for (d in 1:max.day) {
            week.day <- week.day + 1
            if (week.day == 8) week.day <- 1
            if (week.day == 1 & d == 1)
            answer <- answer + 1
        }
    }
}
print(answer)

## First day of the week
library(tidyverse)
firstday <- read_csv("data/first_day.csv")

map_data(map = "world") %>%
  full_join(firstday) %>%
  ggplot(aes(long, lat, group = group, fill = firstday)) +
  geom_polygon() +
  theme_void() +
  coord_fixed() +
  labs(title = "First day of the week")

ggsave("images/problem-019.png", width = 6, height = 4)
