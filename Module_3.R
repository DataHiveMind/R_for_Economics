# Load necessary libraries
install.packages("dplyr")
library(dplyr)


# Read the data
pop <- read_csv("pop.csv")
county_flows <- read_csv("county_flows.csv")

# Combine the data frames
combined_df <- full_join(pop, county_flows, by = "county")

# Create new columns for in- and out-migration as a percentage of total population
combined_df <- combined_df %>%
	mutate(in_migration_percent = in_migration / total_population * 100,
				 out_migration_percent = out_migration / total_population * 100)

# Generate summary statistics by county
summary_stats <- combined_df %>%
	group_by(county) %>%
	summarise(
		mean_in_migration = mean(in_migration_percent, na.rm = TRUE),
		median_in_migration = median(in_migration_percent, na.rm = TRUE),
		min_in_migration = min(in_migration_percent, na.rm = TRUE),
		max_in_migration = max(in_migration_percent, na.rm = TRUE),
		sd_in_migration = sd(in_migration_percent, na.rm = TRUE),
		mean_out_migration = mean(out_migration_percent, na.rm = TRUE),
		median_out_migration = median(out_migration_percent, na.rm = TRUE),
		min_out_migration = min(out_migration_percent, na.rm = TRUE),
		max_out_migration = max(out_migration_percent, na.rm = TRUE),
		sd_out_migration = sd(out_migration_percent, na.rm = TRUE)
	)

# Write the summary statistics to a csv file
write_csv(summary_stats, "summary_stats.csv")