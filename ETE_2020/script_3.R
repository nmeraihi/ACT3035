# apply
m <- matrix(1:12,nrow = 3)
rowSums(m)
apply(m, c(1,2), log)
v1 <- 1
v2 <- 2:15
v3 <- 97:105

x <- array(1:24, dim = c(2,3,4))
x

maListe <- list(noms=c("Mike", "Jessica", "Noureddine"),
                Vehicule=c("BMW", "Civic", "Tesla", "Toyota"),
                Prix=c(30, 15, 50), 
                sexe=c(T, F, T))


# rgression <- list(resultst=..., predictions=..., graph=...)

df <- data.frame(noms=c("Mike", "Jessica", "Noureddine"),
                Vehicule=c("BMW", "Civic", "Tesla"),
                Prix=c(30, 15, 50), 
                sexe=c(T, F, T))
df

attr <- attributes(df)
attr$names

cars
View(cars)
?cars
mean(cars$speed)
sd(cars$speed)


summary(cars)


library(MASS)
?Cars93

View(Cars93)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/1000_HF.csv")
View(df)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/1000_HF.csv",
               header = T)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/1000_HF.csv")[,c(4,6)]


