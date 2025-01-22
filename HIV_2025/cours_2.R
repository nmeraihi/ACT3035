# Jan-22-2024
#  cours 2
x <- 1:5
x
M <- matrix(1:9, 3, byrow = T)
M
A <- array(1:24, dim = c(3,4,2))
A
L <- list(cours=c("ACT3035", "ACT1200", "ACT2035", 
                  "ACT6100", "INF1132", "MAT2080"),
          nbstudents=c(sample(50:70, 6, replace = T)),
          H25=c(T, T, F, F, T, T), 
          University="UQAM"
          )
L$University
L[4]

# Data frame créé manuellement:

df <- data.frame(L$cours, L$nbstudents, L$H25)
df

colnames(df) <- c("cours", "nbstudents", "H25")
df

# Premiere facon de lire les csv en LIGNE
df_assurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/insurance.csv")
# 2e facon est de le lire en local

# Il faut faire attention aux \ et /
df_assurance_l <- read.csv("C:\Users\meraihi_n\Downloads\insurance.csv")
df_assurance_l <- read.csv("C:/Users/meraihi_n/Downloads/insurance.csv")

df_assurance_l <- read.csv("insurance.csv")
setwd("C:/Users/meraihi_n/Desktop/ACT3035H25")
df_assurance_l <- read.csv("insurance.csv")
# Habituellement la fonction setwd se trouve au début
# complètement de mon script R

# Manipulation des données avec dplyr
install.packages("dplyr")
library(dplyr)
load("fremotor1prem.rda")

# piping en R
# Ctrl+Shift+M a créé le %>% pour le piping

donneesSommaires <- fremotor1prem %>% select(DrivAge, VehAge, DrivGender, VehGas) %>%
  filter(VehAge<=5) %>% 
  group_by(DrivGender,VehGas ) %>% 
  summarise(
    age_moyen=mean(DrivAge),
    nombre=n()
  )


# fremotor1prem %>% 
#   group_by(VehGas) %>% 
#   summarise(
#     avg_bonus_malus=mean(BonusMalus),
#     count=n()
#   )
  
# Fonctions sur les caract`res`

text <- "Actuaire junior"
toupper(text)
tolower(text)
nchar(text)
substr(text,1,8)

# réexecut la ligne avec la liste dans le data frame
colnames(df)
# colnames(df)
# [1] "L.cours"      "L.nbstudents" "L.H25"
# On veut maintenant enlever le 'L.' et garder le reste
# Vous pouvez essayer autres solutions
substr(colnames(df),3, 20)

# Il existe plein d'autre sfonction sur les caracteres

# sauvegarde et load des objets
write.csv(df, file = "df_cours_UQAM.csv")

list.files()
# Dans la ligne ci-dessus, c'est l'environnement (dossier)
# dans lequel on a fait notre setwd (environnement de travail)
list.files(pattern = ".R")


# Ci-dessous, on précise un dossier en prticulier
list.files("Téléchargements")


# Jointure avec dplyr:

employees <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/hr/employees.csv")
departments <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/hr/departments.csv")

# si jamais on n'a pas besoin de tout le package dplyr mais seulement la fonction leftjoin.
dplyr::left_join()
# Puisque on vait déjà load toute la librarire dplyr, on peut juste:
df_emply_deprt <- left_join(employees, departments,by = "DEPARTMENT_ID")

rm(L)


























