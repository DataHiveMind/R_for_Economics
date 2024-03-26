# Install and load necessary libraries
install.packages("gapminder")
library(gapminder)
library(ggplot2)

# Load the gapminder dataset
data("gapminder")

# Create box plots for GDP per capita
ggplot(gapminder, aes(x = continent, y = gdpPercap)) +
	geom_boxplot() +
	labs(x = "Continent", y = "GDP per Capita") +
	ggtitle("Box Plots of GDP per Capita by Continent")

# Calculate mean GDP and life expectancy by continent and year
mean_data <- gapminder %>%
	group_by(continent, year) %>%
	summarise(mean_gdp = mean(gdpPercap), mean_life = mean(lifeExp))

# Create time series plot
ggplot(mean_data, aes(x = year, y = mean_gdp, color = continent)) +
	geom_line() +
	labs(x = "Year", y = "Mean GDP per Capita") +
	ggtitle("Mean GDP per Capita by Continent over Time")

# Create scatterplots with population size as point size
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, size = pop)) +
	geom_point(alpha = 0.7) +
	labs(x = "GDP per Capita", y = "Life Expectancy") +
	scale_size_continuous(range = c(2, 10)) +
	facet_wrap(~year, ncol = 3) +
	ggtitle("Scatterplots: Life Expectancy vs. GDP per Capita (by Year)")

# Create scatterplots with logarithmic transformation
ggplot(gapminder, aes(x = log(gdpPercap), y = log(lifeExp), size = pop)) +
	geom_point(alpha = 0.7) +
	labs(x = "Log(GDP per Capita)", y = "Log(Life Expectancy)") +
	scale_size_continuous(range = c(2, 10)) +
	facet_wrap(~year, ncol = 3) +
	ggtitle("Scatterplots with Logarithmic Axes")