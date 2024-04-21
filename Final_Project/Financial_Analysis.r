# Define a function to perform financial analysis using different methods
perform_financial_analysis <- function(stock_data) {
    # Preprocess the data
    stock_data <- na.omit(stock_data)
    stock_data <- stock_data[, c("Date", "Close")]
    
    # Split the data into training and testing sets
    train_size <- floor(0.8 * nrow(stock_data))
    train_data <- stock_data[1:train_size, ]
    test_data <- stock_data[(train_size + 1):nrow(stock_data), ]
    
    # Train the linear regression model
    linear_model <- train(Close ~ ., data = train_data, method = "lm")
    
    # Make predictions on the test data using linear regression
    linear_predictions <- predict(linear_model, newdata = test_data)
    
    # Train the logistic regression model
    logistic_model <- train(Close ~ ., data = train_data, method = "glm", family = "binomial")
    
    # Make predictions on the test data using logistic regression
    logistic_predictions <- predict(logistic_model, newdata = test_data, type = "response")
    
    # Calculate the Black-Scholes option price
    option_price <- BSOptionPrice(S = stock_data$Close, K = 100, r = 0.05, sigma = 0.2, t = 1, type = "call")
    
    # Perform Monte Carlo simulation
    monte_carlo_sim <- MCSimulation(S = stock_data$Close, K = 100, r = 0.05, sigma = 0.2, t = 1, type = "call", n = 1000)
    
    # Return the results
    return(list(linear_predictions = linear_predictions,
                            logistic_predictions = logistic_predictions,
                            option_price = option_price,
                            monte_carlo_sim = monte_carlo_sim))
}

# Call the perform_financial_analysis function
analysis_results <- perform_financial_analysis(apple_stock_data)

# Graph the predicted stock prices using barplot
barplot(predicted_prices, main = "Predicted Stock Prices", xlab = "Date", ylab = "Price")

# Graph the linear predictions using scatterplot
plot(test_data$Date, analysis_results$linear_predictions, main = "Linear Regression Predictions", xlab = "Date", ylab = "Price", type = "p")

# Graph the logistic predictions using line graph
plot(test_data$Date, analysis_results$logistic_predictions, main = "Logistic Regression Predictions", xlab = "Date", ylab = "Price", type = "l")

# Graph the Black-Scholes option price using ggplot
bs_data <- data.frame(Date = stock_data$Date, Option_Price = analysis_results$option_price)
ggplot(bs_data, aes(x = Date, y = Option_Price)) +
    geom_line() +
    labs(title = "Black-Scholes Option Price", x = "Date", y = "Price")

# Graph the Monte Carlo simulation using ggplot
mc_data <- data.frame(Date = stock_data$Date, Monte_Carlo_Sim = analysis_results$monte_carlo_sim)
ggplot(mc_data, aes(x = Date, y = Monte_Carlo_Sim)) +
    geom_line() +
    labs(title = "Monte Carlo Simulation", x = "Date", y = "Price")

# Create a 3D scatter plot of the Black-Scholes option price
scatter3D(bs_data$Date, rep(1, nrow(bs_data)), bs_data$Option_Price, colvar = bs_data$Option_Price,
            col = "blue", pch = 16, xlab = "Date", ylab = "", zlab = "Option Price",
            main = "Black-Scholes Option Price")

# Create a 3D line plot of the Monte Carlo simulation
lines3D(mc_data$Date, rep(2, nrow(mc_data)), mc_data$Monte_Carlo_Sim, col = "red",
        lwd = 2, xlab = "Date", ylab = "", zlab = "Simulation Price",
        main = "Monte Carlo Simulation")

