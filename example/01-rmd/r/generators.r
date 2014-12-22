generator.Bernoulli <- function(p) {
  return (function(n){    
    return (rbinom(n, 1, p))
  })
}

generator.njoin <- function(first, second, n){
  generated <- 0
  generator.single <- function(){
    generated <<- generated + 1
    return (ifelse(generated <= n, first(1), second(1)))
  }
  
  return (function(t){
    return (replicate(t, generator.single()))
  })
}

generator.sequence <- function(theta, gamma, T){
  return (generator.njoin(
    generator.Bernoulli(theta),
    generator.Bernoulli(gamma),
    2**T))
}