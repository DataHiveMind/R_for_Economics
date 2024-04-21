# Install required packages
install.packages(c("quantmod", "tidyquant", "zoo", "TTR", "caret", "ggplot2", 'timeSeries', "pdfetch", "tseries"))
install.packages("plot3D")

# Load required library
library(plot3D)
library(quantmod)
library(tidyquant)
library(zoo)
library(TTR)
library(caret)
library(tseries)
library(timeSeries)
library(forecast)
library(pdfetch)
library(ggplot2)

# Define a function to predict stock price using machine learning
predict_stock_price <- function(stock_data) {
  # Preprocess the data
  stock_data <- na.omit(stock_data)
  
  # Split the data into training and testing sets
  train_size <- floor(0.8 * nrow(stock_data))
  train_data <- stock_data[1:train_size, ]
  test_data <- stock_data[(train_size + 1):nrow(stock_data), ]
  
  # Train the machine learning model
  model <- lm(AAPL.open ~ ., data = train_data) # Specify the formula correctly
  
  # Make predictions on the test data
  predictions <- predict(model, newdata = test_data)
  
  # Return the predicted stock prices
  return(predictions)
}

# Load Apple stock data
apple_stock_data <- pdfetch_YAHOO('AAPL')
train_size <- floor(0.8 * nrow(apple_stock_data))
train_data <- apple_stock_data[1:train_size, ]
print(train_data)

# Call the predict_stock_price function
predicted_prices <-  predict_stock_price(apple_stock_data)

# Plot the Apple stock data using ggplot
ggplot(apple_stock_data, aes(x = AAPL.open, y = AAPL.volume)) +
  geom_line() +
  labs(title = "Apple Stock Data", x = "Volume", y = "Open Price")

# Define a function to find the best time to buy and sell a stock
trading_algorithm <- function(stock_data) {
  # Preprocess the data
  stock_data <- na.omit(stock_data)
  
  # Split the data into training and testing sets
  train_size <- floor(0.8 * nrow(stock_data))
  train_data <- stock_data[1:train_size, ]
  test_data <- stock_data[(train_size + 1):nrow(stock_data), ]
  
  # Train the machine learning model
  model <- lm(AAPL.open ~ ., data = train_data) # Specify the formula correctly
  
  # Make predictions on the test data
  predictions <- predict(model, newdata = test_data)
  
  # Find the best time to buy and sell
  buy_price <- min(test_data$AAPL.open)
  sell_price <- max(test_data$AAPL.open)
  
  # Return the best time to buy and sell
  return(list(buy_price = buy_price, sell_price = sell_price))
}

# Call the trading_algorithm function
best_time <- trading_algorithm(apple_stock_data)
best_time