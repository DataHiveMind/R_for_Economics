# Generate the first 100 Fibonacci numbers
fib_default <- numeric(100)
fib_default[1] <- 0
fib_default[2] <- 1
for (i in 3:100) {
		fib_default[i] <- fib_default[i - 1] + fib_default[i - 2]
}
fib_default

# Generate the first 3 Fibonacci numbers
fib_n <- numeric(3)
fib_n[1] <- 0
fib_n[2] <- 1
for (i in 3:3) {
		fib_n[i] <- fib_n[i - 1] + fib_n[i - 2]
}
fib_n

# Generate Fibonacci numbers with custom starting points
x1 <- 2
x2 <- 4.5
fib_custom <- numeric(5)
fib_custom[1] <- x1
fib_custom[2] <- x2
for (i in 3:5) {
		fib_custom[i] <- fib_custom[i - 1] + fib_custom[i - 2]
}
fib_custom