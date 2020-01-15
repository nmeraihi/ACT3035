# ?rep
rep(5,88)
x <- rep(1:3,19)
length(x)/19
rep(T,29)
rep("string",3)

?runif
set.seed(123)
x <- runif(3)
x
sum(x)
min(x)
max(x)
range(x)
mean(x)
sd(x)
var(x)

mat <- matrix(1:12, 3,byrow = T)
mat
t(mat)

dim(mat)
dim(t(mat))

mat
mat[2,3]
mat[2,]
mat[,2:3]
mat[,c(2,4)]

diag(5)
diag(mat)

# une matrice 20x4 avec va ~unif(0,1)
set.seed(123)
mat1 <- matrix(runif(20*4), nrow = 20)
mat1
rbind(mat, mat1)
nombreCol <- 7
dim(mat)[1]*nombreCol
runif(dim(mat)[1]*nombreCol)
matrix(runif(dim(mat)[1]*nombreCol),dim(mat)[1])
mat3 <- cbind(mat, matrix(runif(dim(mat)[1]*nombreCol),dim(mat)[1]))
dim(mat3)
min(mat3)
max(mat3)
range(mat3)
rowMeans(mat3)
colMeans(mat3)
set.seed(123)
act3035 <- matrix(runif(12, 65,75), 3)
colnames(act3035) <- 2015:2018
rownames(act3035) <- c("Aut", "Hiv", "Ete")
act3035

colMeans(act3035)
rowMeans(act3035)


set.seed(2035)
act2035 <- matrix(runif(12, 65,75), 3)
colnames(act2035) <- 2015:2018
rownames(act2035) <- c("Aut", "Hiv", "Ete")
act2035

act3035-act2035

summary(act3035)

sample(1:20, 3)

sample(1:20, 25,replace = T)

s <- sample(1:5, 1000,replace = T, prob = rep(.2,5))
table(s)

s <- sample(1:5, 1000,replace = T, prob = c(.2,.5,.1,.1,.1))
table(s)

rnorm(20)
n <- rnorm(1000, 0, 100)
mean(n)
sd(n)

array(1:24, dim = c(3,4,2))


maListe <- list(c(1,15,19), "string", T)
maListe
maListe[[1]][2]
maListe[2]

maListe <- list("premier"=c(1,15,19), 
                "deux"="string", 
                "trois"=T)
maListe$premier[2]

df <- read.csv("https://raw.githubusercontent.com/nmeraihi/ACT3035/master/data/CARS_1000.csv")
df

df2 <- read.csv("http://donnees.ville.montreal.qc.ca/dataset/701683f0-a838-4fe0-b4d6-a4964d9ea7f0/resource/9e67d2f3-9104-4af4-aac4-022df621a749/download/donneesouvertes-interventions-sim.csv")
df2
?read.csv
df2$DESCRIPTION_GROUPE
summary(df2)
table(df2$NOM_VILLE)
