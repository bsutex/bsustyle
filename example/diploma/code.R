readinteger <- function() {
  n <- readline(prompt="Enter an integer: ")
  if(!grepl("^[0-9]+$",n)) {
    return(readinteger())
  }
  return(as.integer(n))
}

# real program start here

num <- round(runif(1) * 100, digits = 0)
guess <- -1

cat("Guess a number between 0 and 100.\n")

while(guess != num){
  guess <- readinteger()
  if (guess == num) {
    cat("Congratulations,", num, "is right.\n")
  } else if (guess < num) {
    cat("It's bigger!\n")
  } else if(guess > num) {
    cat("It's smaller!\n")
  }
}