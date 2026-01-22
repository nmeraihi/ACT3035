# Cours 2 ----

## 0) Retour sur le cours #1 ----

#Arondissement
round(pi, digits = 0)

round(4.51, digits = 0)

#Factiorial
factorial(4) == 4*3*2*1


## 1) Intro Vecteur ----

x <- 21
x


vecteur <- c(1,2,3,4,5)
vecteur

class(vecteur)

vecteur2 <- c(12,28,0)
vecteur2


#Autre facon de vecteur ordonné

vecteur <- 1:5
vecteur

vecteur <- 5:0
vecteur

#vecteur des élément chiffre decimaux

vecteur <- 1.5:5.5
vecteur

vecteur <- 1.5:6
vecteur

# taille d'un vecteur 

length(vecteur)


### Extraction a l'interieur d'un vecteur ----

#Extraction un élément
vecteur[1]

vecteur[3]

vecteur[6]

vecteur[2+1]

#Extraction plusieurs éléments 

vecteur[c(1,2,3)]
vecteur[1:3]

vecteur[c(1,3,5)]

#Enlever des d'éléments

vecteur[-1]

vecteur[-c(1,2,3)]

vecteur[-c(1,2,3,4,5)]

#Enleve rien dans le vecteur
vecteur[-6]

#A l'aide d'un vecteur booleen 

vecteur[c(T,T,F,F,F)]


### Test sur les vecteurs ----

vecteur > 3

vecteur <= 3

sum(vecteur > 3)

#function all, tous les élément d'un vecteur sont TRUE
all(vecteur>3)
all(vecteur>0)


#filtrage , Acces logique a l'interieur d'un vecteur. 

vecteur[vecteur>3]

vecteur[vecteur==3.5]

vecteur[vecteur!=3.5]

#Plusieurs conditions 

vecteur[vecteur>3 & vecteur<5]

vecteur[vecteur>3 | vecteur<=1.5]

vecteur[vecteur>10]

#contraire
vecteur[!(vecteur>3 & vecteur<5)]

vecteur[!(vecteur>3 | vecteur<=1.5)]


### Combinaison de vecteurs ---- 

x <- 1:3

y <- c(0.17, 0.35, 2.6)

z <- 11

vecteur_assemble <- c(x,y,z)
vecteur_assemble

vecteur_assemble_2 <- c(vecteur_assemble, 100:150)
vecteur_assemble_2

### Vecteur charactere ---- 

vect_string <- c("bonjour", "hola", "Hi", "Salem")
vect_string

class(vect_string)

vect_string == "bonjour"

### Vecteur Booleen ---- 

vect_bool <- c(T,F,T,F,T)

vect_bool

class(vect_bool)


### Vecteur plusieurs types ---- 

vect_plus_type <- c(25, "ACT3035", TRUE)
vect_plus_type

class(vect_plus_type)

vect_plus_type[1] + 1


### Operation sur les vecteur 

vecteur <- 1:10

vecteur

#Multiplication 
vecteur * 2

#Addition#soustraction 

vecteur + 5

vecteur - 10

#Exposant 

vecteur ** 2
vecteur ^ 2

vecteur * vecteur

#Attention vecteur taille différent 

a <- 1:5 
b <- 1:6 

a + b

a * b

### Fonction Sequence ---- 

seq(from= 1, to = 5, by = 1)

seq(from= 1, to = -5, by = -1)

seq(from= 0, to = 10, by = 2)

seq(from= 1, to = 10, by = 2)


#from default = 1, by default = 1
seq(5)


# Test entre vecteurs 

seq(5)
seq(2,6,1)

seq(5) == seq(2,6,1)

seq(5) == seq(1,9,2)

### Fonction Replicate ----

rep(1, 5)

nb_fois <- 10

rep("qqch", nb_fois)

rep(1:5, 3)

rep(TRUE, 4)

### Nommer les éléments d'un vecteur ----

notes <- c(math = 15, info = 18, stats = 12)
notes
class(notes)

notes["info"]
notes[2]

notes[c("info", "stats")]

### valeur NA ---- 

v <- c(1,2,NA, 4, NA)

length(v)
v

v+2

is.na(v)
!is.na(v)

sum(is.na(v))


### Statistique Desciptive sur vecteur ----

x_v<-c(1,5,7,3,2,3,6,8,7,3,10)

y_v <- seq(1.1,2,.1)

z_v <- x_v^2/-.5


#sum 

sum(x_v)

sum(x_v, z_v)

#Min et max

min(x_v)
max(y_v)

max(x_v, z_v)

#moyenne 

mean(x_v)

mean(c(x_v,y_v))

#Valeurs abérantes
mean(c(x_v,y_v), trim = 0.1)


#Mediane 

median(x_v)


# Ecart type  

sd(x_v)

sd(c(x_v,z_v))


# Variance 

var(x_v)


# Opération avec NA 

x <- c(1:10, rep(NA,4))
x

sum(x)

sum(x, na.rm = TRUE)

mean(x)

mean(x, na.rm = TRUE)

## 2) Intro Matrice ---- 

A <- matrix(c(6,8,1,1,4,2), nrow = 2, ncol = 3)

A

A1 <- matrix(c(6,8,1,1,4,2))
A1

A2 <- matrix(c(6,8,1,1,4,2), nrow = 2)
A2

#recyclage
A3 <- matrix(c(6,8,1,1,4,2), nrow = 4)
A3


class(A)
length(class(A))


### Transpose ----


A
t(A)

vec <- seq(c(1,2,3,4,5))
class(vec)


t_vec <- t(vec)
t_vec
class(t_vec)

### Dimmension ----

A
dim(A)
length(dim(A))

dim(vec) # Ne fonctionne pas 


dim(t(vec))


### Extraction d'élément dans matrice 

A[1,3]
A[2,2]

#Existe pas
A[2,4]

#colonne complet

A[c(1,2),1]

A[,1]

A[2,c(1,2,3)]

A[2,]

B <- matrix(seq(1,9.5,0.5), 3)
B

B[, c(2,4)]

### Matrice identité ----

diag(5)

diag(5, x = 15)


### Opération sur les matrice ---- 

A

A*2

A/2

A^2

C <- B*2

C+B

#Matrice doivent etre de meme dimention pour l'addition
A + B

all(dim(A) == dim(B))
all(dim(C) == dim(B))

# Exemple 

A<-matrix(c(30,32,31,27,36,72,60,78,67,71,55,57,56,55,49),ncol=3)
A

#Convertir 

A <- round((A-32)/1.8,0)
A

#Nommer les lignes et les colonnes

colnames(A) <-  c("Fairbanks", "San Fransisco", "Chicago")
A


rownames(A) <- c("3/12", "3/13", "3/14", "3/15", "3/16")
A

View(A)

B<-matrix(c(88,85,83,81,78,62,61,54,60,65,90,92,91,89,90),ncol=3)
colnames(B)<-c("Los Angeles","Seattle","Honolulu")
rownames(B)<-c("3/12", "3/13", "3/14", "3/15", "3/16")


B <- round((B-32)/1.8,0)
B

# Bind

cbind(A,B)

rbind(A,B)


### Matrice en vecteur + Stat descriptive ---- 

mat_combine <- cbind(A,B)

c(mat_combine)

class(c(mat_combine))

#Statistique 

min(mat_combine)
max(mat_combine)


range(mat_combine)

sd(mat_combine)

rowMeans(mat_combine)
colMeans(mat_combine)

rowSums(mat_combine)
colSums(mat_combine)


max(mat_combine[,2])

max(mat_combine[,"San Fransisco"])

#Corelation

cor(mat_combine)
cor(t(mat_combine))

#Summary 

summary(mat_combine)

summary(t(mat_combine))


### Apply functions ----

#Apply
m <- matrix(c(1:12), nrow = 3)
m

log(m)


h <- apply(m, MARGIN = c(1,2), log)
h


m

apply(m, MARGIN = 2, sum)
apply(m, MARGIN = 1, sum)


apply(m, MARGIN = 2, function(x) x>5)


#lapply --> aplly sur des list

x <- list(vecteur_1 = 1, vecteur_2 = 1:-17, vecteur_3 = rep(100,10))

x

x$vecteur_1
x$vecteur_3

class(x)

lapply(x, FUN = length)

length(x)


lapply(x, FUN = max)

lapply(x, function(y) y+5 )

# sapply , simplifie le output 

sapply(x, mean)

class(sapply(x, mean))

sapply(x, sort)


y <- list(vecteur_1 = 1:5, vecteur_2 = 0:-4, vecteur_3 = rep(100,5))

lapply(y, length)


sapply(y, sort)


# 3) Variable aléatoire / Simulation ---- 

# Loi Uniforme

runif(1, 0, 10)


runif(10, 0, 10)


x <- runif(10, 0, 10)


# Loi normal 

rnorm(1, mean = 5, sd = 5)

rnorm(20, mean = 5, sd = 5)

rnorm(20)

normal <- rnorm(1000, mean = 5, sd = 5)

mean(normal)
sd(normal)

#Loi exponentiel #gamma

rexp(10, rate =5)

rgamma(10000, shape = 2, scale = 2)

#Loi Poisson 

rpois(10, lambda = 5)


# Bernouili/Binomial 

#bernouli 
rbinom(10, 1, prob = 0.5)

#binomial 
rbinom(10, 5, prob = 0.5)


# Loi uniforme discrete 

#Avec remise
sample(1:10, size = 5, replace = TRUE)

sample(1:10, size = 100, replace = TRUE)

#Sans remise 
sample(1:10, size = 5, replace = FALSE)

sample(1:10, size = 10, replace = FALSE)

#Erreur
sample(1:10, size = 11, replace = FALSE)

#Probabilité 

sample(1:3, size = 100, replace = TRUE, prob = c(0.25, 0.5, 0.25))

table(sample(1:3, size = 100, replace = TRUE, prob = c(0.25, 0.5, 0.25)))


prop.table(table(sample(1:3, size = 100, replace = TRUE, prob = c(0.25, 0.5, 0.25))))


#character 

state.name


sample(state.name, 5)




#Set.Seed

sample(1:10, size = 5, replace = TRUE)


set.seed(1414)

sample(1:10, size = 5, replace = TRUE)
