###########################
#Auteur: Alexandre LeBlanc#
#Demonstration #8         #
#Cours: ACT3035           #
#Date: 27/03/18           #
###########################

############################################################################
#Lien pour les fonctions 'join': http://r4ds.had.co.nz/relational-data.html#
############################################################################

############################
#Installation de paquetages#
############################
install.packages(c('dplyr', 'formattable'))
library(dplyr)
library(formattable)

path <- "https://raw.githubusercontent.com/nmeraihi/data/master/"

###############
#QUESTION 1(a)#
###############
df <- read.csv(paste(path, "qc_hommes_2.csv", sep = ""), header = TRUE)
str(df)
colnames(df) <- c("age", "lx")

head(df, n = 10)
tail(df, n = 10)

###############
#QUESTION 1(b)#
###############
df$age <- gsub("ans et plus", "", df$age)
df$age <- gsub("ans", "", df$age)
df$age <- gsub("an", "", df$age)

class(df$age)
df$age <- as.numeric(df$age)
class(df$age)

###############
#QUESTION 1(c)#
###############

###########
#R de base#
###########
(dx <- df$lx[-nrow(df)] - df$lx[-1])
df$dx <- c(dx, 0)

head(df)

############
#Avec dplyr#
############
(dx <- c(select(df, lx)$lx[-nrow(df)] - select(df, lx)$lx[-1], 0))
df <- mutate(df, dx)

head(df)

###############
#QUESTION 1(d)#
###############

###########
#R de base#
###########
(qx <- df$dx / df$lx)
df$qx <- qx

head(df)

############
#Avec dplyr#
############
(qx <- select(df, dx)$dx / select(df, lx)$lx)
df <- mutate(df, qx)

head(df)

###############
#QUESTION 1(e)#
###############
(tpx <- df$lx[22 + 4] / df$lx[22 + 1])
percent(tpx)

############
#QUESTION 2#
############
df1 <- data.frame(Id = 1:4, Age = c(14, 12, 15, 10))
df2 <- data.frame(Id = 1:4, Sex = c('F', 'M', 'M', 'F'), Code = letters[1:4])
df1
df2

(M <- merge(df1, df2, by = 'Id'))

############
#QUESTION 3#
############
prix_AAPL <- read.csv(paste(path, "AAPL_month.csv", sep = ""), header = TRUE)
prix_BA <- read.csv(paste(path, "BA_month.csv", sep = ""), header = TRUE)

(prix_mensuels <- cbind(prix_AAPL$Adj.Close, prix_BA$Adj.Close))
colnames(prix_mensuels) <- c("Apple", "Boeing")

cor(prix_mensuels)

###############
#QUESTION 4(a)#
###############
values <- read.csv(paste(path, "HackerRank-Developer-Survey-2018-Values.csv", sep = ""), header = TRUE)
str(values)
levels(values$q3Gender)

values_sexe <- values %>% group_by(q3Gender) %>% filter(q3Gender %in% c("Male", "Female")) %>% count()  
values_sexe$n <- values_sexe$n / sum(values_sexe$n) * 100
values_sexe  


