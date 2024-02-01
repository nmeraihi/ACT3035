?if (condition) {
  
}

vec <- c(T, F, F, T, T, T, T)
vec
as.numeric(vec)

length(vec)
length(1:10)
vec<1:7

nombre <- 0
if (nombre >0) {
  print("le nombre est positif")
} else if (nombre <0) {
  print("le nombre est négatif")
} else {
  print("le nombre est zéro")
}


basePremium <- 500


driverAge <- 33

if (driverAge<25) {
  agePremium <- 200
} else if (driverAge >=25 && driverAge <=65){
  agePremium <- 0
} else {
  agePremium <- 100
}

carAge <- 7

if (carAge<1) {
  carPremium <- -50
} else if (carAge >=1 && carAge <=5){
  carPremium <- 0
} else {
  carPremium <- 150
}
  
finalPremium <- basePremium + agePremium + carPremium
finalPremium





calculePrime <- function(driverAge, carAge){
  
  if (driverAge<25) {
    agePremium <- 200
  } else if (driverAge >=25 && driverAge <=65){
    agePremium <- 0
  } else {
    agePremium <- 100
  }
  
  if (carAge<1) {
    carPremium <- -50
  } else if (carAge >=1 && carAge <=5){
    carPremium <- 0
  } else {
    carPremium <- 150
  }
  
  finalPremium <- basePremium + agePremium + carPremium
  return(finalPremium)
}

calculePrime(18, 7)

driverAge <- 33
carAge <- 4
print(paste("La prime d'un conducteur agé  de",
            driverAge, " ans conduisant un véhicule agé de",
            carAge, " ans devrait avoir une prime d'un montant de",
            calculePrime(driverAge, carAge), "$"))


# 
# calculePrime(plusieurs âges, 
#              plusieurs âges de véhicules)


ageConducteur <- c(33,25,45,88,19)
ageVehicule <- c(1,8,5,3,17)
# ça ne marche pcq vecteur against one element
calculePrime(driverAge = ageConducteur, 
             carAge = ageVehicule)

primes <- numeric(length(ageConducteur))

  
for (i in 1:length(ageConducteur)) {
  # print(calculePrime(ageConducteur[i],ageVehicule[i]))
  primes[i] <- calculePrime(ageConducteur[i],ageVehicule[i])
}

primes


for (i in 1: length(ageConducteur)){
  print(paste("La prime d'un conducteur agé  de",
              ageConducteur[i], " ans conduisant un véhicule agé de",
              ageVehicule[i], " ans devrait avoir une prime d'un montant de",
              # primes[i])) Pas bon car risque de réutiliser des valeurs
              #  pas à jour
              calculePrime(ageConducteur[i], ageVehicule[i]), "$"))
}

taille <- 200000
moyennes <- NULL

a <- system.time(
  for (i in 1:taille) {
    mu <- mean(rnorm(100))
    moyennes <- rbind(moyennes, mu)
  }
)
a

moyennes <- numeric(taille)
b <- system.time(
  for (i in 1:taille) {
    mu <- mean(rnorm(100))
    moyennes[i] <- mu
  }
)

b



