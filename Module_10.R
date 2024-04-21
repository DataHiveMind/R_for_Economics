remotes::install_github("JustinMShea/wooldridge")
library(wooldridge)
data("hprice1")

# Fit the linear regression model
price_model <- lm(price ~ sqrft + bdrms, data = hprice1)

# Get the coefficient for 'bdrms'
bdrms_coefficient <- coef(price_model)["bdrms"]

# Calculate the expected increase in price for an extra bedroom
expected_increase <- bdrms_coefficient * 1000  # Convert to dollars

# Print the result
cat("For the average home in this dataset, we can reasonably expect that if you added an extra bedroom, you would increase the expected selling price by $", round(expected_increase), sep = "")
