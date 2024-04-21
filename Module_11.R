install.packages("rvest")
install.packages("polite")

# Load required libraries
library(rvest)
library(polite)

# Define a function to scrape links from a Wikipedia page
scrape_wikipedia_links <- function(url) {
  session <- bow(url, force = TRUE)  # Introduce ourselves politely
  result <- scrape(session, query = list(per_page = 100)) %>%
    html_nodes("a") %>%
    html_attr("href")
  return(result)
}

# Example: Scrape links from the SUNY system page
suny_links <- scrape_wikipedia_links("https://en.wikipedia.org/wiki/State_University_of_New_York")

# Repeat the above step for other Wikipedia pages of interest

# Combine all links into a data frame
all_links <- data.frame(links = suny_links)

# Save the data frame to a CSV file
write.csv(all_links, file = "wikipedia_links.csv", row.names = FALSE)
