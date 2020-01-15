setwd("C:/Users/ec291358/Desktop/ACT3035")
setwd("C:/Users/ec291358/Desktop/ACT3035")
rm(list = ls())


x<-55
string <- "string"
bool<- T
BOOL2<-TRUE
  #
ls()
rm(x)
class(bool)
class(string)

is.numeric(bool)

?is.numeric

x <- 13
y<-29
z<-55

x+y

x**2+3*y

pi

w<-x**2+3*y/pi

round(w)

floor(w)
ceiling(w)

abs(-35)
log(10)
factorial(3)

monVecteurNum <- c(1,2,3,4,5)

class(monVecteur)

monVectString <- c("BMW","Tesla","Honda","Toyota")

monVectMelange <- c(33548,"Tesla",T,"Toyota")


monVecteurNum/2
monVectMelange/2

monVecBiz <- c("1","2","3")

?as.numeric

as.numeric(monVecBiz)
as.numeric(monVectMelange)/2

vec <- c(1,2,3,4,5)
vec20 <- c(1:20)
vec20

?seq

seq(1,29, pi)
seq(from=1, to=29, by=pi)
seq(to=29, by=pi, from=1 )

vec5 <- 1:5

vec5V2<-seq(1,5,1)

vec==vec5V2

!all(vec==vec5V2)

?rep
rep(335, 20)

rep("Je t'aime", 10000)

vec <- 1:20
sum(vec)

min(vec)
max(vec)
range(vec)
mean(vec)
median(vec)
sd(vec)
var(vec)



A <- matrix(1:9,3)

A
vec5

?matrix

matrix(1:9,3, byrow = T)

A
t(A)

B <- matrix(1:12,3)
B
t(B)

dim(A)
dim(B)
dim(t(B))
B
B[,4]
B[2,3]/8

C<-matrix(seq(1,29, pi), 3)
C


c(C[2,2],C[2,3])
i<-2:3
C[2,i]

C[2,2:3]

C[2,-1]


C[2,-1:-2]
C[2,-(1:2)]

seq(1, 20, 2)-1

seq(1, 70, pi)[seq(1, 20, 2)-1]

t(diag(5))
A**2

?cbind



A
B
cbind(A, B)
rbind(A, B)
rbind(A, C)



A
c(A)

set.seed(3035)
x<-runif(1000, 0, 1)

mean(x)
sd(x)

X<-matrix(x, 100)
X

mean(X)

summary(X)

set.seed(3035)
sample(x, 5)

sample(x, 1001, replace = T)


y<-rnorm(100000, 0, 100)

mean(y)
sd(y)












