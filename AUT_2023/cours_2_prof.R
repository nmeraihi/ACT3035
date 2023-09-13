x <- c(5,3,8)
x
print(x)
x <- c(1:2023)
length(x)
x**2
x/pi
factorial(1:4)
sum(x)
min(x)
max(x)
mean(x)
median(x)
sd(x)
var(x)

AF <- matrix(c(6,8,1,4,2,1),nrow = 2, ncol = 3)
AF

?matrix

AT <- matrix(c(6,8,1,4,2,1),
             nrow = 2, 
             ncol = 3, 
             byrow = T)
AT

t(AT)

dim(AT)
dim(t(AT))

dim(x)
?dim


x <- c(5,3,8)
x
AT

AT[2,]
AT[,2]
AT[1,2]

AT[,c(1,3)]

diag(5)

AT*2
AT+AT

AT+t(AT)


AT <- matrix(c(6,8,1,4,2,1),
             nrow = 2, 
             ncol = 3, 
             byrow = T)
AT
AC <- matrix(c(8,7,15,12,9,1),
             nrow = 2, 
             byrow = T)
AC
AC/AT

AT

colnames(AT) <- c("Déc", "Jan", "Fév")
AT
rownames(AT) <- c("Motréal", "Québec")
AT

cbind(AT, AF)
rbind(AT,AF)
rbind(AF,AT)

# transformer cette matrice en vecteur
x <- c(rbind(AF,AT))
x


min(AF)
range(AF)

AF

summary(AF)

runif(100)
runif(100, 1, 10)
x <- runif(10)
x
runif(5)
set.seed(123)
runif(5)

set.seed(2035)
runif(5)


set.seed(3035)
sample(1:10, 5)

# avec remise
set.seed(3035)
sample(1:10, 20, replace = T)

set.seed(3035)
s <- sample(1:5, 1000, replace = T)
table(s)/length(s)


set.seed(3035)
s <- sample(1:5, 
            1000, 
            replace = T,
            prob = c(.2, .5, .1,.1,.1))
table(s)/length(s)


rnorm(1)
?rnorm

x <- rnorm(10000, 0, 100)
mean(x)
sd(x)

x <- array(1:24, dim = c(3,4,2))
x

?array

?list

x <- list(vecteur=c(1,5,2), utilisateur="Mike", new=T)
x

x$utilisateur
rep(x$utilisateur,20)

villes <- c("Montréal", "Québec", "Laval")
population <- c(4308000, 485827, 437500)
# source: n'importe quoi
metropole <- c(T, F, F)

df <- data.frame(villes, population, metropole)
df
?write.csv
write.csv(df, 
          "df.csv", 
          row.names =F, 
          fileEncoding = "latin1")
getwd()
setwd(getwd())

# On donne le chemin (path) exact du fichier
read.csv("C:\Users\meraihi_n\Downloads\TSLA.csv")
df_tesla <- read.csv("C:/Users/meraihi_n/Downloads/TSLA.csv")

# On se déplace dans le folder où se trouve le fichier TSLA
setwd("C:/Users/meraihi_n/Downloads")
df_tesla_wd <- read.csv("TSLA.csv")
?read.csv

# première façon de la faire est d.écraser les noms de colonnes
head(df_tesla)
colnames(df_tesla)
Open_sept_23
paste(colnames(df_tesla),"_sept_23", sep = "")
colnames(df_tesla) <- paste(colnames(df_tesla),"_sept_23", sep = "")
head(df_tesla)

# 2eme facon d efaire est de  lire sans les noms de colonnes 
# ensuite écrire ce qu'on veut

df_tesla <- read.csv("C:/Users/meraihi_n/Downloads/TSLA.csv", 
                     header = F)
df_tesla <- read.csv("C:/Users/meraihi_n/Downloads/TSLA.csv", 
                     header = T)
head(df_tesla)

?read.csv

cars <- read.csv("https://github.com/nmeraihi/data/blob/master/CARS_1000.csv")

cars <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/CARS_1000.csv")

head(cars)


# Pour le prochain cours mercredi le 20 sept
install.packages("dplyr")
library(dplyr)


