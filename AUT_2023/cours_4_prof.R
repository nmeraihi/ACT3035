age <- as.integer(readline(prompt = "Entrez l'age: "))
health <- readline(prompt = "Saisir l'état de santé de l'assuré (Good/Average/Poor): ")

age <- 35
health <- "Poor"

prime <- 0

if (age<30 && health=="Good") {
  prime <- 1000
  # prime = 1000
} else if (age<30 && health=="Average"){
  prime=1500
} else if (age>=30 && (health=="Average" || health=="Poor")){
  prime <- 2000
} else {
  prime <- 2500
}

cat("La prime payée par l'assurée est : ", prime)
combien <- 10000000

policyholder <- data.frame(
  ID=1:combien,
  age=sample(18:100, combien, replace=T),
  # age=c(25,30,45,22,35),
  # health=c("Good", "Average", "Poor", "Good", "Average")
  health=sample(c("Good", "Average", "Poor"), combien, replace=T)
)

primes <- c()
temps_ecoule <- system.time(
for (i in 1:nrow(policyholder)) {
  age <- policyholder$age[i]
  health <- policyholder$health[i]
  if (age < 30 && health=="Good") {
    prime=1000
  } else if (age<30 && health=="Average"){
    prime=1500
  } else if (age >=30 && (health=="Average" || health == "Poor")){
    prime=2000
  } else {
    prime =2500
  }
  # print(age)
  primes <- c(primes, prime)
}
)
temps_ecoule
policyholder$primes <- primes

debut <- Sys.time()
primes <- numeric(combien)
primes[policyholder$age<30 & policyholder$health =="Good"] <- 1000
primes[policyholder$age<30 & policyholder$health =="Average"] <- 1500
primes[policyholder$age>=30 & policyholder$health =="Average" | policyholder$health =="poor" ] <- 2000
primes[!(primes %in%c(1000,1500, 2000))] <- 2500
policyholder$Prime <- primes
fin <- Sys.time()
fin-debut

creeDF <- function(combien, name="df_policyholder") {
    name <- data.frame(
    ID=1:combien,
    age=sample(18:100, combien, replace=T),
    health=sample(c("Good", "Average", "Poor"), combien, replace=T)) 
}
assurance <- creeDF(1000, name)


CalculPrimesDF <- function(df) {
  primes <- numeric(nrow(df))
  primes[df$age<30 & df$health =="Good"] <- 1000
  primes[df$age<30 & df$health =="Average"] <- 1500
  # primes[df$age>=30 & df$health =="Average" | df$health =="poor" ] <- 2000
  primes[df$age>=30 & df$health =="Average"] <- 2000
  primes[df$age>=30 & df$health =="poor" ] <- 2000
  primes[!(primes %in%c(1000,1500, 2000))] <- 2500
  df$Prime <- primes
  return(df)
}

assurance <- CalculPrimesDF(assurance)














