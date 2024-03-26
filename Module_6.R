# Function to generate a list of randomly chosen birthdays
birthday_sample <- function(group_size) {
	# Generate random birthdays (1-365) for group_size individuals
	birthdays <- sample(1:365, group_size, replace = TRUE)
	return(birthdays)
}

# Function to check if there are any duplicate birthdays
birthday_match <- function(birthdays) {
	# Check if there are any duplicates in the list of birthdays
	return(any(duplicated(birthdays)))
}

# Function to repeat birthday_match for a given number of repetitions and group size
many_samples <- function(reps, group_size) {
	# Initialize a vector to store the results
	results <- rep(NA, reps)

	# Repeat the experiment reps times
	for (i in 1:reps) {
		# Generate a sample of birthdays
		birthdays <- birthday_sample(group_size)

		# Check if there are any matches
		results[i] <- birthday_match(birthdays)
	}

	return(results)
}

# Process the output of many_samples to a useful format
process_output <- function(results) {
	# Calculate the proportion of experiments where there was a match
	proportion_matches <- mean(results)

	return(proportion_matches)
}