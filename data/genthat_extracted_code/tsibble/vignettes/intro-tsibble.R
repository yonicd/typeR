## ----initial, echo = FALSE, cache = FALSE, results = 'hide'--------------
knitr::opts_chunk$set(
  warning = FALSE, message = FALSE, echo = TRUE,
  fig.width = 7, fig.height = 6, fig.align = 'centre',
  comment = "#>"
)
options(tibble.print_min = 5)

## ----weather-------------------------------------------------------------
library(tsibble)
library(lubridate)
weather <- nycflights13::weather %>% 
  select(origin, time_hour, temp, humid, precip)
weather

## ----weather-ts, message = TRUE------------------------------------------
weather_tsbl <- as_tsibble(weather, key = id(origin))
weather_tsbl

## ----weather-tsum--------------------------------------------------------
weather_tsbl %>%
  group_by(origin) %>%
  index_by(date = as_date(time_hour)) %>% 
  summarise(
    temp_high = max(temp, na.rm = TRUE),
    temp_low = min(temp, na.rm = TRUE)
  )

## ----flights-------------------------------------------------------------
flights <- nycflights13::flights %>%
  mutate(sched_dep_datetime = 
    make_datetime(year, month, day, hour, minute, tz = "America/New_York"))

## ----flights-ts----------------------------------------------------------
flights_tsbl <- flights %>%
  as_tsibble(
    key = id(carrier, flight), 
    index = sched_dep_datetime, 
    regular = FALSE
  )
flights_tsbl

