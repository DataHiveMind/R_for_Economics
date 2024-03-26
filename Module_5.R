install.packages("fredr")
install.packages("tidyverse")
install.packages("scales")

library(fredr)
library(tidyverse)
library(scales)

fredr_search_text("unemployment rate")

unemployment_dinstall.packages("fredr")
install.packages("tidyverse")
install.packages("scales")

library(fredr)
library(tidyverse)
library(scales)

fredr_search_text("unemployment rate")

unemployment_data <- fredr(series_id = "UNRATE", observation_start = as.Date("1990-01-01"), observation_end = as.Date("2000-01-01"))

ggplot(data = unemployment_data, mapping = aes(x = date, y = value)) +
geom_line() +
labs(x = "Observation Date", y = "Unemployment Rate", title = "US Unemployment Rate")ata <- fredr(series_id = "UNRATE", observation_start = as.Date("1990-01-01"), observation_end = as.Date("2000-01-01"))

ggplot(data = unemployment_data, mapping = aes(x = date, y = value)) +
geom_line() +
labs(x = "Observation Date", y = "Unemployment Rate", title = "US Unemployment Rate")