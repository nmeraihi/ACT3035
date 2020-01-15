seq(from=-20, to=-5, by=1)
?rep
rep(1:4, 2)

vect_trimestre <- rep(1:4, 5)
vect_trimestre
print(vect_trimestre)
rep("je t'aime mon amour", 25)
rep(T, 15)
a <- c(1:5)
b <- .25
rep(a*b, 15)
rep((c(1:5)*.25),15)

intet <-.049
rep(a*intet, 96)
rep(a/intet, 96)

rep()

summary(vect_trimestre)
min(vect_trimestre)
mean(vect_trimestre)
max(vect_trimestre)
length(vect_trimestre)

vect_nquoi <- c(15,19,.25,-0.03,4,55)
range(vect_nquoi)
min(vect_nquoi)
max(vect_nquoi)

range(vect_nquoi)[1]
range(vect_nquoi)[2]

range(vect_nquoi)[1]/range(vect_nquoi)[2]
vec_range <- range(vect_nquoi)
vec_range[1]

sd(vec_range)
var(vec_range)

matrice <- matrix(c(1,5,7,8,9,10), nrow = 2)
matrice
matric_5 <- matrix(c(1,5,7,8,9), nrow = 2)
matric_5
matrix(c(1,5,7,8,9,10), nrow = 2)
matrix(data=c(1,5,7,8,9,10), nrow = 2, ncol = 3, byrow = T)
matrix(c(1,5,7,8,9,10), nrow = 2)
matrice[1,3]
matrice[2,2]
matrice[1,1]
matrice[1, ]
matrice[,2]

mat_4_4 <- matrix(seq(25,75,3.25), 4)
mat_4_4
length(seq(25,75,3.25))

matrix(seq(25,75,3.25),4)[,c(2,4)]

mat_4_4**2

matr_5_3 <- matrix(30:44, nrow = 5) 
matr_5_3

matr_5_3_C <- floor((matr_5_3-32)/1.8) 
matr_5_3_C

colnames(matr_5_3_C) <- c("Montreal", "Laval", "Toronto")
matr_5_3_C
vec_mois <- paste("03", 2012:2016, sep = "/")
rownames(matr_5_3_C) <- vec_mois
matr_5_3_C[4,] <- c(1,5,5)
matr_5_3_C
matr_5_3_C[, "Laval"]

matr_5_3
matr_5_3_C


?cbind
cbind(1:5, 5:9)
rbind(1:5, 5:9)
t(cbind(1:5, 5:9))
t(rbind(1:5, 5:9))


matr_5_3_C


cor(matr_5_3_C)

summary(matr_5_3_C)

runif(10, 0,1)
vec_alea<- runif(10, 0,1)
vec_alea
runif(10)
mat_ale <- matrix(runif(9),3) 
mean(mat_ale)
mat_ale <- matrix(runif(9),3) 
mean(mat_ale)
# Moi
set.seed(3035)
mat_ale <- matrix(runif(9),3) 
mean(mat_ale)
# Mon collegue
set.seed(3035)
mat_ale <- matrix(runif(9),3) 
mean(mat_ale)

set.seed(3035)
vect_10 <- runif(10)
vect_10
set.seed(3035)
sample(vect_10, 3)

set.seed(3035)
sample(state.name, 3)


set.seed(3035)
sample(vect_10, 3)
vect_10
sample(vect_10, 11, replace = T)
rep(.2,5)
s <- sample(1:5,1000 ,replace = T, prob = rep(.2,5))
s
table(s)
set.seed(3035)
s2 <- sample(1:5,1000 ,replace = T, prob = c(.2, .5, .1,.1,.1))

table(s2)

?rnorm
set.seed(3035)
rnorm(1)
set.seed(3035)
rnorm(1,mean=0, sd=1)


set.seed(3035)
rn <- rnorm(1000000)
mean(rn)
sd(rn)



