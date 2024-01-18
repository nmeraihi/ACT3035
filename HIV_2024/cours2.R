annees_olymp <- seq(2024,2100,4)
annees_olymp
annees_olymp*2
annees_olymp**2
log(annees_olymp)
round(log(annees_olymp), 2)
?floor()
floor(log(annees_olymp))
ceiling(log(annees_olymp))
abs(-15)
factorial(4)
4*3*2*1

x <- 25
sqrt(x)
x**1/2
x**(1/2)

annees_olymp
sum(annees_olymp)
length(annees_olymp)
min(annees_olymp)
max(annees_olymp)
range(annees_olymp)
mean(annees_olymp)
median(annees_olymp)
sd(annees_olymp)
var(annees_olymp)

# pcq aucun sense sur les années olymp, essayon autre exemple

set.seed(123)
set.seed(3035)
nombre_alea <- runif(10) 
nombre_alea
sum(nombre_alea)
length(nombre_alea)
min(nombre_alea)
max(nombre_alea)
range(nombre_alea)
mean(nombre_alea)
median(nombre_alea)
sd(nombre_alea)
var(nombre_alea)

# 10, 100, 1000, 10000, 100000
nombre_alea <- runif(10)
mean(nombre_alea)
nombre_alea <- runif(100)
mean(nombre_alea)
nombre_alea <- runif(1000)
mean(nombre_alea)
nombre_alea <- runif(10000)
mean(nombre_alea)
nombre_alea <- runif(100000)
mean(nombre_alea)
nombre_alea <- runif(1000000)
mean(nombre_alea)
nombre_alea <- runif(10000000)
mean(nombre_alea)
nombre_alea <- runif(100000000)
mean(nombre_alea)

rnorm(10, 100, 5)

nombre_alea <- rnorm(100000000, 100, 5)
mean(nombre_alea)
sd(nombre_alea)

# sans remise
sample(1:10, 5)

# avec remise
sample(1:10, 5, replace = T)
sample(1:10, 100, replace = T)


x <- sample(1:5, 100, replace = T)
table(x)
table(x)/length(x)


x <- sample(1:5, 100000000, replace = T)
table(x)
table(x)/length(x)


x <- c(1,2,3)
y <- c(4,5,6)
z <- c(7,8,9)

c(x,y,z)
M <- matrix(c(x,y,z), 3)
?matrix

M
M <- matrix(c(x,y,z), 3, byrow = T)
M
matrix(1:9,3)
matrix(1:9,3)[1,2]

matrix(1:9,3)[,3]

matrix(1:9,3)**2

diag(5)
t(diag(5))


M <- matrix(c(x,y,z), 3, byrow = T)
M
t(M)


saisons <- c("HIV", "PR", "ETE", "AUT")
Villes <- c("MTL", "QC")
data <- matrix(nrow = 2, ncol = 4)
?matrix
data
colnames(data) <- saisons
rownames(data) <- Villes
data
data[1,] <- c(-8, 2, 21, 2)
data[2,] <- c(-14, -1, 15, -3)
data

BC <- c(5,15,28,18)
rbind(data,BC)

data

summary(data)
min(data)
max(data)
range(data)
mean(data)
sd(data)


array(1:24, dim = c(3,4,2))

x <- list(taille=c(1.75,1.99,1.55), saisons, c(T,F))
x
x$taille
x[[3]]


x <- list(taille=c(1.75,1.99,1.55), saisons, accident=c(T,F))
x
x$taille
x$accident

df <- data.frame(data[1,], data[2,])

df <- read.csv("C:\Users\meraihi_n\Downloads\collisions_routieres.csv")
df <- read.csv("C:/Users/meraihi_n/Downloads/collisions_routieres.csv")

getwd()
setwd("C:/Users/meraihi_n/Desktop/ACT3035")
getwd()


df <- read.csv("collisions_routieres.csv")

df_cars_1000 <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/CARS_1000.csv")

View(df_cars_1000)

df_aautoass <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/ausprivauto0405.csv")

summary(df_aautoass)
dim(df_aautoass)
df_aautoass$Exposure






