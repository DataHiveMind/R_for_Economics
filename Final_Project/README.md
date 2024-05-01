# Apple Stock Price Prediction using R

This script uses historical stock data for Apple Inc. (AAPL) to predict future stock prices. It uses ggplot2 to plot the volume and open prices of the stock and then creates an algorithm to find the best time to buy and sell the stock.

# The Reason Why You want this project and What to learn from it

Learning R programming can be a daunting task for beginners, but with a hands-on project like predicting the price of Apple stock, the process becomes more engaging and practical. To start, one can gather historical data on the stock using an API or a CSV file. Then, they can use R libraries like tidyverse, quantmod, and ggplot2 to manipulate, visualize, and analyze the data. The next step is to build a predictive model using regression or time series analysis techniques. Once the model is trained, it can be used to predict future prices of the stock. Additionally, the volume and price data can be plotted using ggplot2 to identify trends and patterns. Finally, the best time to buy and sell the stock can be determined using the predicted prices and a trading strategy. This project not only teaches R programming but also valuable skills in finance and data analysis.

## Required Packages

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

## Data

The historical stock data used for this analysis is obtained from Yahoo Finance using the `prefetch` and `qauntmod` packages. The data spans from January 1st, 2010 to December 31st, 2020.

## Data Exploration

The first step in the analysis is to explore the data. We use `ggplot` to plot the volume and open prices of the stock. From the plot, we can see that the volume of stock traded has increased over time, and there is a general upward trend in the open prices.

## Data Preprocessing

Before we can build a model to predict future stock prices, we need to preprocess the data. We first split the data into training and testing sets. We use the data from January 1st, 2010 to December 31st, 2019 as the training set, and the data from January 1st, 2020 to December 31st, 2020 as the testing set.

## Evaluation
We create a function predict_stock_price() and use linear regression models to make predictions to find future stock prices.

## Ploting
We plot the open price and volume of Apple stock being traded during the period using the ggplot and geom_line method.

## Trading Algorithm

We create a simple trading algorithm that buys and sells the stock based on the predicted prices. The algorithm buys the stock when the predicted price is higher than the current price and sells the stock when the predicted price is lower than the current price.

## Conclusion

This script shows how to use R to predict stock prices and create a simple trading algorithm. However, it is important to note that the predictions made by the model may not always be accurate and should be used with caution.
