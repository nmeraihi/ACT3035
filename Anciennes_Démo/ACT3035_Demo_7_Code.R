###########################
#Auteur: Alexandre LeBlanc#
#Demonstration #7         #
#Cours: ACT3035           #
#Date: 20/03/18           #
###########################

############################
#Installation de paquetages#
############################
install.packages("formattable")
library(formattable)

############
#QUESTION 1#
############
set.seed(25)
x1 <- rnorm(100, mean = 0, sd = 1)
x2 <- runif(100, min = 0, max = 10)

mat_x1 <- matrix(x1, nrow = 10)

mean(mat_x1)
var(c(mat_x1))
sd(mat_x1)^2

############
#QUESTION 2#
############
set.seed(25)
(xx1 <- sample(x1, 4))
xx2 <- sample(xx1, 1000, replace = TRUE, prob = c(0.1, 0.1, 0.1, 0.7))

table(xx2) / length(xx2) 

############
#QUESTION 3#
############
set.seed(25)

swimH <- rnorm(1002, mean = 40, sd = 3)
bikeH <- rnorm(1002, mean = 2.75 * 60, sd = 8)
runH <- rnorm(1002, mean = 2.0833 * 60, sd = 10)

swimF <- rnorm(1300, mean = 50, sd = 5)
bikeF <- rnorm(1300, mean = 3 * 60, sd = 5)
runF <- rnorm(1300, mean = 2.25 * 60, sd = 1)

resultatsH <- rbind(swimH, bikeH, runH) / 60
resultatsF <- rbind(swimF, bikeF, runF) / 60
resultatsFH <- cbind(resultatsF, resultatsH) 

set.seed(25)
colnames(resultatsFH) <- sample(ncol(resultatsFH), ncol(resultatsFH))
dossardsH <- colnames(resultatsFH)[1:ncol(resultatsH)]
dossardsF <- colnames(resultatsFH)[(ncol(resultatsH) + 1):ncol(resultatsFH)]

rownames(resultatsFH) <- c("swimFH", "bikeFH", "runFH")

(gagnantSwim <- which(resultatsFH[1,] == min(resultatsFH[1,])))
min(resultatsFH[1,])
resultatsFH[,gagnantSwim]

(gagnantBike <- which(resultatsFH[2,] == min(resultatsFH[2,])))
min(resultatsFH[2,])
resultatsFH[,gagnantBike]

(gagnantRun <- which(resultatsFH[3,] == min(resultatsFH[3,])))
min(resultatsFH[3,])
resultatsFH[,gagnantRun]

(gagnantF <- which(colSums(resultatsF) == min(colSums(resultatsF))))
colSums(resultatsF)[gagnantF]
dossardsF[gagnantF]

(gagnant <- which(colSums(resultatsFH) == min(colSums(resultatsFH))))
colSums(resultatsFH)[gagnant]

############
#QUESTION 4#
############
ann <- 1:5
i = 0.025

(facteursEscompte <- (1 / (1 + i)^ann))
(PV <- 153.25 * sum(facteursEscompte))
(PV <- 153.25 * (1 - facteursEscompte[5]) / i)

############
#QUESTION 5#
############
i = 0.05
d = i / (1 + i)
round(d, 6)

############
#QUESTION 6#
############
MaListe <- list(ssd = c(256, 128, 512), machine = c("Macbook Pro"), best = c(TRUE))

MaListe$ssd
names(MaListe)
MaListe[[1]][3]
MaListe[[3]] <- c(TRUE, FALSE, TRUE)
MaListe

############
#QUESTION 7#
############
x <- c(71, 18, 86, 5, 58, 19, 14, 9, 74, 75, 59, 24, 7, 51, 50, 63, 35, 53, 72, 61)

x[10]
x[seq(from = 1, to = 19, by = 2)]
x[which(x %% 2 == 0)]
x[which(x %% 2 != 0)]
x[-c(3, 5, 17)]

(res <- table(x %% 2 == 0))
names(res) <- c("Pair", "Impair")
res

############
#QUESTION 8#
############
set.seed(25)

(x <- matrix(sample(1:100, 12 * 7), nrow = 12, ncol = 7))
x[5, 6]
x[c(3, 9),]
x[,seq(from = 1, to = 7, by = 2)]
x[,which(1:ncol(x) %% 2 != 0)]

#################
#QUESTION 9 (Q1)#
#################
d <- 0.0927
(delta = log((1 - d)^(-1)))
(PV = round(1000 * exp(-6.25 * delta), 2))

##################
#QUESTION 10 (Q2)#
##################
d <- 0.053286
(delta = log((1 - d)^(-1)))
(FV = round(1300 * exp(10.5 * delta), 2))

##################
#QUESTION 11 (Q3)#
##################
i_4 <- 0.13
(delta = log((1 + i_4 / 4)^4))
(FV = 50232 * exp(17 * delta))

##################
#QUESTION 12 (Q4)#
##################
d_12 <- 0.06
(delta = log((1 - d_12 / 12)^(-12)))
(PV = 82309 * exp(-8 * delta))

##################
#QUESTION 13 (Q5)#
##################
i_2 <- 0.04
(PV = 50 * (1 - (1 + i_2 / 2)^-20) / (i_2 / 2) * (1 + i_2 / 2))

#############
#QUESTION 14#
#############
set.seed(123)
taille <- rnorm(100, mean = 1.7, sd = 0.1)
head(taille)

summary(taille)

#############
#QUESTION 15#
#############
pnorm(1.9, mean = 1.7, sd = 0.1)
1 - pnorm(1.6, mean = 1.7, sd = 0.1)

############################
#Avec la fonction 'percent'#
############################
percent(pnorm(1.9, mean = 1.7, sd = 0.1))
percent(1 - pnorm(1.6, mean = 1.7, sd = 0.1))

#############
#QUESTION 16#
#############
pexp(10, rate = 1 / 50)

############
#Simulation#
############
sim <- rexp(100, rate = 1 / 50)
length(sim[sim >= 60])

########
#Exacte#
########
100 * (1 - pexp(60, rate = 1 / 50))




