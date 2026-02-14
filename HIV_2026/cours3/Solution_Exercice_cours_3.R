
#Exercice sur les fonctions appliqués aux caractères -----

#Exercice #1 

# Soit le vecteur :

noms <- c("Alice", "bob", "CHARLIE")

# 1) Transforme tous les noms en minuscules

tolower(noms)


# 2) Transforme tous les noms en majuscules

toupper(noms)

 
# 3) Calcule la somme des caractères du vecteur

sum(nchar(noms))



#Exercice #2 

# Soit les vecteurs :

prenom <- c("Alice", "Bob", "Charlie")
age <- c(22, 25, 30)

# Crée le vecteur avec ces trois éléments
# "Alice (22 ans)"
# "Bob (25 ans)"
# "Charlie (30 ans)"


paste(prenom, " (", age, " ans)", sep = "")


#Exercice #3 : 

# soit le vecteur : 

codes <- c("A1", "B12", "c3", "AA4", "D007", "E")

# 1) Identifie les codes qui commencent par une lettre majuscule

grep("^[A-Z]", codes, value = TRUE)



# 2) Identifie les codes qui se terminent par un chiffre

grep("[0-9]$", codes, value = TRUE)


# 3) Identifie les codes composés de 1 lettre majuscule suivie d’au moins 1 chiffre

grep("^[A-Z][0-9]+$", codes, value = TRUE)


#Exercice #4

#Soit le vecteur : 

x <- c("  R  ", " Python ", "SQL")

# 
# 1) Supprime les espaces inutiles

trimws(x)


# 2) Transforme Python en majuscules dans le vecteur


x_clean <- trimws(x)
x_clean[x_clean == "Python"] <- toupper("Python")
x_clean

#Exercice #5 

txt <- c("R est puissant", "R est rapide", "Python est populaire", "R")


# 1) Calcule le nombre de caractères de chaque phrase

nchar(txt)

# 2) Calcule le nombre de mots de chaque phrase

mot <- strsplit(txt, " ")

sapply(mot, length)

# 3) Identifie les phrases contenant exactement le mot "R" seul

txt[grepl("R", txt)]

#Exercice sur les fonctions appliqués aux dates -----

# Exercice #1

dates <- c("2024-01-15", "2024-03-01", "2024-12-31")

# 1) Convertis ce vecteur en objet Date
# 
dates <- as.Date(dates)


# 2) Ajoute 14 jours à chaque date

dates + 14


# 3) Calcule le nombre de jours entre la première et la dernière date
 
dates[3] - dates[1]
dates[length(dates)] - dates[1] #meme chose mais plus flexible


# 4) Identifie les dates qui sont après le 1er février 2024

dates[dates > as.Date("2024-02-01")]



#Exercice #2 

debut <- as.Date("2023-09-01")
fin   <- as.Date("2024-02-01")

# 1) Crée une séquence de dates mensuelles

seq(debut, fin, by = "month")



# 2) Compte le nombre de dates dans cette séquence

length(seq(debut, fin, by = "month"))


# 3) Identifie les dates appartenant à l’année 2024

seq(debut, fin, by = "month")[substr(seq(debut, fin, by = "month"),1,4)=="2024"]


#Plus facile a voir
vec_date <- seq(debut, fin, by = "month")

vec_date[substr(vec_date,1,4)=="2024"]

# 4) Affiche uniquement le mois de ces dates

months(seq(debut, fin, by = "month"))
