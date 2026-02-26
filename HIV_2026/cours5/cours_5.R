## Cours 5 -----


# List = Dictionnaire de vecteur.

x <- list(taille = c(1,5,2), utilisateur = "Mike", new = c(T,T,F,T,F))
x

x$taille[2]

x[[1]][2]

### Data.Frame ----
#Data.Frame c'est une liste mais avec des vecteur de même longueur, 
#c'est un peu comme un tableau/matrice

#Une matrice est tableau qui est homogene 

# Un dataframe c'est une tableau de données qui permet des colonnes de type différents


villes <- c("Montreal", "Quebec", "Laval")
Population <- c(2000000, 600000, 400000)
metropole <- c(T, F, F)

donnee_ville <- data.frame(villes, Population, metropole)
donnee_ville

class(donnee_ville)

View(donnee_ville)

#Attribut de data.frame
attributes(donnee_ville)

#Nom de colonnes
names(donnee_ville)

#Extraction dans df 

donnee_ville[,1]
donnee_ville[,2]


donnee_ville[2,]

donnee_ville[2,2]



donnee_ville$villes

str(donnee_ville)
summary(donnee_ville)


#Ajout de colonnes 

donnee_ville$note_sur_10 <- c(10,9,5)
donnee_ville


donnee_ville$note_sur_10 <- donnee_ville$note_sur_10 - 1 
donnee_ville

donnee_ville[,4] <- donnee_ville$note_sur_10 - 1 
donnee_ville

### Factor ---- 

y <- factor(c("Paris", "Lyon", "Paris", "Marseille"))
y

levels(y)
class(y)
is.character(y)
is.factor(y)

levels(donnee_ville$villes)

as.numeric(y)


#Retour dataframe 

donnee_ville <- data.frame(villes, Population, metropole, stringsAsFactors = T)
donnee_ville
str(donnee_ville)


# Data Car93 

library(MASS)

#Dans mon environnement
data(Cars93)


class(Cars93)

dim(Cars93)
str(Cars93)

summary(Cars93)



### Importation de données 

getwd()


test_csv <- read.csv("ACT3035/Data/exemple_1.csv")
test_csv

test_csv <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/exemple_1.csv")
test_csv

test_csv <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/exemple_1.csv", header = F)
test_csv


test_csv <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/exemple_1.csv", header = F, skip = 2, sep= ",") 
test_csv


#Enregistrer df

write.csv(test_csv, "ACT3035/Data/exemple_1_write.csv")

#Lire fichier txt 

test_txt <- read.table("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/exemple_1.txt", sep = ",", header = T)
test_txt

write.table(test_txt, "ACT3035/Data/exemple_1_write.txt")


### Traitement des valeurs manquantes ---- 

df <- read.table("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/exemple_2_2.txt", sep  = ",", header = T)

df



is.na(df)

is.na(df[1,1])
is.na(df[2,1])

mean(df$km)
mean(df$km, na.rm = TRUE)


na.omit(df$km)
mean(na.omit(df$km))

#Retrait des lignes avec NA 
na.omit(df)

#Remplacement des valeurs manquantes 

df[2,1] <- mean(df[,1], na.rm = TRUE)

#Tous les NA à la fois
df[is.na(df)] <- 0
df


# Ordonner un df 

order(df$vitesseMoyenne)

df[order(df$vitesseMoyenne),]

order(df$vitesseMoyenne, decreasing = TRUE)

df[order(df$vitesseMoyenne, decreasing = TRUE),]



### Package dplyr ---- 

install.packages("dplyr")


library(dplyr)


df_ass <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/refs/heads/master/assurance.csv", stringsAsFactors = T)
dim(df_ass)


names(df_ass)
str(df_ass)


head(df_ass, 3)
tail(df_ass,10)



#Parenthese ordonner avec plusieurs colonnes
df_ass[order(df_ass$nbsin, df_ass$numeropol),]



#Ordonner 

#Croissant
arrange(df_ass, nbsin)

#Décroissant 
arrange(df_ass, desc(nbsin))
arrange(df_ass, desc(nbsin), numeropol)
                

#Selection 

select(df_ass, numeropol, type_territoire, nbsin)

#Filtrer 

filter(df_ass, nbsin==2)


filter(df_ass, nbsin==2, type_prof == "Médecin")

filter(df_ass, nbsin==2, type_prof %in% c("Médecin", "Technicien"))

filter(df_ass, nbsin==2, grepl("^M", type_prof))


filter(df_ass, nbsin==2 | grepl("^M", type_prof), myopie == "Y")

#Mutate 

mutate(df_ass, dummy = "xxxx")

mutate(df_ass, age_veh = 2026 - annee_veh, dummy = "xxxx")


df_ass2<- mutate(df_ass, utilisation_newsplit = case_when( grepl("Travail", utilisation) ~ "Travail",
                                                  TRUE ~ "Loisir"))
table(df_ass2$utilisation_newsplit)

