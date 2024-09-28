###########################
#Auteur: Alexandre LeBlanc#
#Demonstration #6         #
#Cours: ACT3035           #
#Date: 13/03/18           #
#Modifié le 20/03/18      #
###########################

############
#QUESTION 1#
############
round(pi, 3)
round(pi, 5)

############
#QUESTION 2#
############
(vec1 <- seq(from = 1, to = 12, by = 1))
(vec1 <- c(vec1, 16:18))

############
#QUESTION 3#
############
(vec2 <- c(0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0))
(vec2 <- seq(from = 0, to = 5, by = 0.5))

############
#QUESTION 4#
############
(vec3 <- 2 * seq(from = 1, to = 25, by = 1))

##############
#Modification#
##############
vec3 <- 1:50
(vec3 <- vec3[vec3 %% 2 == 0])

############
#QUESTION 5#
############
(A <- matrix(1:8, nrow = 2, ncol = 4, byrow = TRUE))
(A <- matrix(1:8, nrow = 2, ncol = 4, byrow = FALSE))

############
#QUESTION 6#
############
(B <- matrix(vec3, nrow = sqrt(length(vec3)), byrow = TRUE))

############
#QUESTION 7#
############
diag(7)

#############################################################################
#Si possible, toujours utiliser apply et ses variantes au lieu d'une boucle!#
#############################################################################
apply(diag(7), 2, rev)

############
#QUESTION 8#
############
Montreal <- c(1718241, 1735096, 1746940, 1767753)
Quebec <- c(530474, 533857, 536013, 538918)
Laval <- c(417325, 421959, 425481, 429413)
Gatineau <- c(274180, 276290, 278050, 281392)

population <- matrix(c(Montreal, Quebec, Laval, Gatineau), nrow = 4, ncol = 4, byrow = TRUE)
rownames(population) <- c("Montreal", "Quebec", "Laval", "Gatineau")
colnames(population) <- 2013:2016
population

##################
#Autre possbilite#
##################
population <- rbind(Montreal, Quebec, Laval, Gatineau)
colnames(population) <- 2013:2016
population 

HOMA <- c(20000, 20500, 23000, 23800)
population[1,] = population[1,] - HOMA
population

(population <- rbind(population, HOMA))
















