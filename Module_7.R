# Part 1
# Load necessary libraries
library(ggplot2)
library(dplyr)

# Number of random points
n <- 10000

# Generate random points
df <- data.frame(x = runif(n, -1, 1), y = runif(n, -1, 1))

# Add a column to indicate if the point is inside the circle
df <- df %>% mutate(inside = ifelse(sqrt(x^2 + y^2) <= 1, 'inside', 'outside'))

# Estimate pi
pi_estimate <- 4 * nrow(filter(df, inside == 'inside')) / n

# Plot the points and the circle
ggplot(df, aes(x = x, y = y, color = inside)) +
	geom_point() +
	coord_fixed() +
	theme_minimal() +
	ggtitle(paste("Estimate for pi:", round(pi_estimate, 2)))


# Part 2
# Function to calculate the probability of at least one shared birthday
prob_shared_birthday <- function(n) {
	p <- 1
	for (i in 1:n) {
		p <- p * (365 - i + 1) / 365
	}
	return(1 - p)
}

# Generate data
df <- data.frame(n = 1:100)
df <- df %>% mutate(prob = sapply(n, prob_shared_birthday))

# Plot the probability
ggplot(df, aes(x = n, y = prob)) +
	geom_line() +
	theme_minimal() +
	ggtitle("Probability of at least one shared birthday")