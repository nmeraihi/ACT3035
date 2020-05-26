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

df2 <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/demograph_data.txt")
read.table("https://raw.githubusercontent.com/nmeraihi/data/master/demograph_data.txt", header = T)


order(df$nbsin)

# install.packages("dplyr")
library(dplyr)
df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/assurance.csv")
head(df)

colnames(df)
arrange(df, desc(nbsin), annee_permis)

select(df, nbsin, annee_permis)

filter(df, marque_voiture=="AUDI")

dff <- mutate(df, cout1_tx=cout1*1.09)

summarise(df, max_cout1=max(cout1, na.rm = T))

df %>%
  select(numeropol, type_territoire, nbsin) %>% #r
  filter(type_territoire=="Rural") %>% #g
  filter(numeropol>1500) #f

df %>% 
  group_by(type_territoire, sexe) %>% 
  summarise(nbsinTot=sum(nbsin))

# question: quel est le nombre de sinistre total
# ainsi que le coût total
# par profession et par fréquence de pmt, 
# seulement pour les véhicules munis d'une alarme, 

un_bonjour <- "bonjour"
salutation <- c("Bonjour", "Hi", "Hello")




substr(un_bonjour, 4,5)

nchar(un_bonjour)

substr(un_bonjour, 4,nchar(un_bonjour))
monNom <- "noureddine"

paste("Bonjour", monNom, sep = " + ")

grep("H", salutation)
grep("o", salutation)


strsplit(un_bonjour, "j")

sub("j", "g", un_bonjour)

sub("o", "O", salutation)
gsub("o", "O", salutation)


Sys.Date()
il_est <- Sys.time()
il_est
il_est+1
il_est+60

as.numeric(il_est)

weekdays(il_est)
months(il_est)

difftime(il_est, il_est+60)
as.numeric(difftime(il_est, il_est+60))
as.numeric(difftime(il_est, il_est+60, units = "sec"))

setwd("~/gd/00_propre/ACT3035/git/ACT3035/ETE_2020")
# Sous Windows il faut changer les barres
# setwd("~\gd\00_propre\ACT3035\git\ACT3035\ETE_2020")


df_2 <- df %>%
  select(numeropol, type_territoire, nbsin) %>% #r
  filter(type_territoire=="Rural") %>% #g
  filter(numeropol>1500)


write.csv(df2, "df.csv")

file.exists("df.csv")
file.rename("df.csv", "df2.csv")
list.files()

file.remove("df2.csv")


