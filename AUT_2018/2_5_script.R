x=seq(from=-1, to=-5, by=-.3)
x
vec1 <- seq(5)
vec2 <- 1:5  # c(1,2,3,4,5)
vec1==vec2
all(vec1==vec2)
all(c(T,T,T,T,T))
all(c( TRUE,TRUE,TRUE,TRUE,TRUE))
!all(vec1==vec2)
rep(1:4, 2)

nb_fois=5
rep("qqch", nb_fois)
rep(c("Toyota", "Prius", "Honda", "Civic"), 5)

x_v <- seq(1,15, 3)
y_v <- c(1,15,17, 19, -33)
z_v <- x_v**2/-.5


sum(x_v)
print(x_v)

length(seq(1,99, .6))
seq(1,99, .6)

max(y_v)
min(y_v)
range(y_v)[2]
mean(y_v)




A <- matrix(data=c(1,2,5,6,9,10),nrow = 3, 
            ncol =2,byrow = T)
A
A2 <- matrix(data=c(1,2,5,6,9,10),nrow = 3, 
             ncol =2,byrow = F)
A
A2
t(A2)
vec1

t(vec1)

dim(A)
dim(vec1)
dim(t(vec1))
A
A[3,2]
A[3,2]*2

A[3, 3]
A[,1]
dim(A)[1]
nb_lignes <- dim(A)[1]
A[nb_lignes, 1]

B<-matrix(seq(1,9.5,.5), 3)

print(B)
B[,c(3,5)]
B <- t(B)
print(B)
B[c(3,5),]

diag(x=1,5)
t(diag(x=-1,5))

A<-matrix(c(30,32,31,27,36,72,60,78,67,71,55,57,56,55,49),ncol=3)
A

seq(30,45)
length(seq(30,44))



AF <- matrix(data=seq(30,44), ncol = 3)
AF
AC <- (AF-32)/1.8
AC <- round((AF-32)/1.8, 0)
AC

colnames(AC) <- c("Quebec", "Trois_riv", "Montreal")
AC

rownames(AC) <- 2010:2014
AC

?paste

paste("Je", "t'aime",sep = "+")

rep(paste("Je", "t'aime"), 25)




rownames(AC) <- paste("3", 2010:2014, sep="/")
AC

B <- matrix(data=seq(28,42), ncol = 3)
B
colnames(B) <- c("Laval", 
                  "lorraine", 
                  "Saint-Leonard")
AC
rownames(B) <- paste("3", 2012:2016, sep="/")
B
print(cbind(AC, B))

AC
B
print(rbind(AC,B))
t(AC)
t(B)
print(rbind(t(AC), t(B)))
c(AC)
range(AC)
sd(AC)

temp <- cbind(AC, B)
temp
rowMeans(temp)
colMeans(temp)
cor(temp)
summary(temp)
temp
summary(t(temp))

x <- runif(5, min=.5, max = 1.5)
x

x <- runif(100, 0, 1)
x
x_en_matri <- matrix(x, 10)
x_en_matri

set.seed(456)
runif(5, 0,1)


?sample
vec <- 1:10
vec
set.seed(123)
sample(vec,15,replace = T)
vec2 <- 1:2
vec2
sample(vec2, 100, replace = T)
state.name
sample(state.name, 10)

s<-sample(1:5, 1000, replace=T)
s
table(s)[[2]]/length(s)

s<-sample(1:5, 1000, replace=T,
          c(.2,.5,.1,.1,.1))

sample()
  
rnorm(10,mean = 0,sd = 1)


x <- rnorm(10000, mean = 5, sd = 3)
mean(x)
sd(x)
 


x<-array(1:24, dim=c(3,4,2))
x

maListe <- list(taille=c(1,5,3),
                Utilisateur="Mike",
                new=T)

maListe

maListe[[2]]


villes <- c("Montréal", "Laval", "Quebec")
population <- c(1999999, 500000, 600000)
village <- c(F,T,T)
df <- data.frame(villes, population, village)
df



attributes(df)
df
df[,1]
df[,2]
df[2,2]

df$villes

df <- data.frame(villes, population, village, stringsAsFactors = F)
df$villes

str(df)

library(MASS)
data("Cars93")

Cars93
str(Cars93)



