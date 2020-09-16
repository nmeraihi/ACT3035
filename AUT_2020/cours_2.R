x <- 12
x <- 77
x+1

y <- 99
z <- 1999

x+y+z
x*y
x/y
x**2
round(x/y, 2)
z_div_y <- z/y

ceiling(z/y)
floor(z/y)

ceiling(z_div_y)
floor(z_div_y)

abs(-15)

x^(1/2)

x^1/2

factorial(5)

x <- 12
x <- c(12)

xx <- c(1,2,3,4,5,6)
xx/2

vec <- c(55:99)
vec <- 55:99
vec
vec*2

seq(from=55, to=99, by=2)
seq(from=55, to=99, by=pi)

vec <- 1:20
vec

vec[7]

vec <- seq(from=55, to=99, by=pi)
vec
vec[7]


3:7
vec[3:7]
vec[c(3,4,5,6,7)]

vec[c(1,3,5)]
vec_2 <- vec[-c(1,3,5)]

vec_vec <- c(vec, vec_2)
vec_vec

length(vec_vec)

vec_auto <- c("BMW", "AMG", "Volks", "Honda", "Toyota")

vec_bool <- c(T, F, F, F, F, T)

vrai_auto <- ("TESLA")

c(vec_auto, vrai_auto)


melange <- c(vec_vec, c(vec_auto, vrai_auto), vec_bool)
melange


vec1 <- 1:6
vec1

vec2 <- 6:12
vec2

vec1+vec2

vec3 <- 6:11
vec3

vec1+vec3

seq(-1, -5, -.5)


vec1
vec3
vec1==vec3

seq(5)
1:5
seq(5)==1:5
all(seq(5)==1:5)

?rep

rep("Bonne entrée", 1000)

paste("ACT","3035", sep = "")


rep("annee", 50)
paste(rep("annee", 50), 1:50, sep = "_")

sum(vec_vec)
mean(vec_vec)
median(vec_vec)
sd(vec_vec)
var(vec_vec)


runif(10)
runif(n=1000,min = 10, max = 20)


runif(10)

set.seed(3035)
runif(10)

set.seed(3035)
sample(vec_vec, 3)

length(vec_vec)

sample(vec_vec, 35, replace = T)

1:5

set.seed(3035)
s <- sample(1:5, 1000, replace = T)

table(s)
sum(table(s))


set.seed(3035)
s2 <- sample(1:5, 1000, replace = T, prob=c(.2, .5, .1, .1, .1))

s2
table(s2)


?rnorm
rnorm(1)


set.seed(3035)
rn <- rnorm(10000)

mean(rn)
sd(rn)

A <- matrix(1:12, nrow = 3)
A
B <- matrix(1:12, nrow = 3, byrow =T)

B
?matrix

A
t(A)
dim(A)
nligne <- dim(A)[1]
ncol <- dim(A)[2]

dim(t(A))


A[2,2]
A[2,3]**2
A[,2]
A[,c(2,4)]

diag(5)
t(diag(5))


A**2

cbind(A, A)
rbind(A, A)

c(A)


set.seed(3035)
C<- matrix(runif(12), nrow = 3)

C
min(C)
max(C)

summary(C)


set.seed(3035)
D<- matrix(runif(10000), nrow = 1000)

summary(D)

range(D)

colMeans(D)

set.seed(3035)
E<- matrix(runif(16), nrow = 5)

cor(E)

array(1:24, dim = c(3,4,2))

assures <- list(nb_accidents=c(0, 1, 0, 0, 2),
                noms=c("A", "A", "C", "B", "X"), 
                alarme=c(T, T, F, F, T))

assures[1]
assures$nb_accidents


nb_accidents <- c(0, 1, 0, 0, 2)
noms <- c("A", "A", "C", "B", "X") 
alarme <- c(T, T, F, F, T)

df_assur <- data.frame(nb_accidents, noms, alarme)
df_assur

attributes(df_assur)

# nom de colonnes:
colnames(df_assur)
attributes(df_assur)[1]
attributes(df_assur)[1]$names
attributes(df_assur)[[1]]

df_assur$alarme

library(MASS)
data("Cars93")
Cars93
?Cars93

summary(Cars93)

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/1000_HF.csv")
summary(df)
head(df)

# paste("variable", 1:8, sep="_")
# colnames(df) <- paste("variable", 1:8, sep="_")
# head(df)

df_cr <- read.csv("http://donnees.ville.montreal.qc.ca/dataset/cd722e22-376b-4b89-9bc2-7c7ab317ef6b/resource/05deae93-d9fc-4acb-9779-e0942b5e962f/download/collisions_routieres.csv")
df_cr <- read.csv("~/Downloads/collisions_routieres.csv")

# df <- read.csv("~/Downloads/ImportSurv-demo/data/Oil_and_Gas_Annual_Production__Beginning_2001.csv")
# head(df)


df_cr[is.na(df_cr)] <- 0

?read.csv



