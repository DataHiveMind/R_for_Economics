# Calculate Fibonacci sequence up to 1000
fibonacci <- numeric(1000)
fibonacci[1] <- 0
fibonacci[2] <- 1
for (i in 3:1000) {
	fibonacci[i] <- fibonacci[i-1] + fibonacci[i-2]
	if (fibonacci[i] > 1000) {
		fibonacci <- fibonacci[1:(i-1)]
		break
	}
}

# Iterate from 0 to 1000
for (i in 0:1000) {
	if (i %in% fibonacci) {
		print("fib")
	} else if (i %% 15 == 0) {
		print("fizzbuzz!")
	} else if (i %% 3 == 0) {
		print("fizz")
	} else if (i %% 5 == 0) {
		print("buzz")
	} else {
		print(i)
	}
}
