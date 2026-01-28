
# Cours #4  ----

## 1) Fonction sur caracteres ----

#Initialiser des objet caractere 
un_bonjour <- "Bonjour"
salutations <- c("Bonjour", "Hi", "hey", "Salam")
mot <- "world"
question <- "Quel est le language de programmation préféré des actuaires?"
reponse <- "Rrrrrrrr"


### Concatenation ----

bonjour_world <- paste(un_bonjour, mot)
bonjour_world

paste(un_bonjour, mot, sep = "")

paste(un_bonjour, mot, sep = "-")

paste("1", "+", "1", "=", "2")

paste("1", "+", "1", "=", "2", sep= "ok")


#Avec un vecteur 

paste(salutations, mot)

length(paste(salutations, mot))

# Deux vecteurs
paste(salutations, salutations, "!")

# Concatenation sans espace 

paste0(salutations, mot)


###Nombre de symboles dans un caractere ---- 

nchar(mot)

nchar(question)


nchar(salutations)

nchar(250)


### Extraction < l'interieur d'un caractere ----

question

reponse


substr(reponse, start = 2, stop = 5)

substr(question, 13, 20)

substr(question, nchar(question)-9, nchar(question))




### Diviser/splitter un caractere ---- 

#Rappel sur les list 


liste <- list("un" = 1:5, "deux" = 6:10, "trois" = 11:15)

liste
class(liste)

liste$un
liste$deux
liste$trois

liste[[1]][1]
liste[[2]][3]

#split

split <- strsplit(question, split = " ")
split

split[[1]][2]

class(split)


split_vecteur <- strsplit(salutations, "j")
split_vecteur



### Recherche a l'interieur d'un caractere ----- 

#position 

grep("j", salutations)


grep("e", salutations)


grep("j", salutations, value = TRUE)

grep("H", salutations, value = TRUE)


grep("New", state.name, value=TRUE)

### Detecter une suite caractere dans un objet caractere ---- 


#Retourne booleen TRUE/FALSE 

grepl("jour", un_bonjour)

grepl("nuit", un_bonjour)

grepl("?", question)
grepl("!", question)

grepl("jour", salutations)

#Expression Régulière 

codes <- c("A12", "B7", "a9", "Ccc", "2c8")

#chiffres
grepl("[0-9]", codes)

#Majuscule 

grepl("[A-Z]", codes)

#Minucsule 

grepl("[a-z]", codes)


#Commence avec majuscule/minuscule/chiffre

grepl("^[0-9]", codes)
grepl("^[A-Z]", codes)
grepl("^[a-z]", codes)

grepl("^A", codes)


#fini avec majuscule/minuscule/chiffre

grepl("[0-9]$", codes)
grepl("[A-Z]$", codes)
grepl("[a-z]$", codes)

grepl("2$", codes)

#fini avec plsuieurs éléments 

grepl("[0-9]{5}$", "555555555")
grepl("^[0-9]{5}", "555555555")


#Combinaison de symbole 

grepl("[A-Z][0-9]", codes)

grepl("^[A-Z][0-9]", codes)

grepl("[A-Z][0-9]$", codes)

grepl("^[A-Z][0-9]{2}", "B12999999999999999")

### Remplacement a l'interieur d'un caractere ---- 

sub("actuaires", "compatables", question)

sub("Actuaires", "compatables", question)

#premiere occurence seulement! 
sub("filles", "garcons", "les filles sont des filles")


gsub("filles", "garcons", "les filles sont des filles")

gsub(" ", "", question)

gsub(" ", "-", question)



gsub("[A-Z]", "B", question)
gsub("[a-z]", "9", question)


codes <- c("A12", "B7", "a9", "Ccc", "2c8")

gsub("^[0-9]", "9", codes)
gsub("[0-9]$", "*", codes)


### Majuscule minuscule ---- 

tolower(question)

toupper(question)


tolower(salutations)
toupper(salutations)


### trimmer ----- 

trimws(" Salut ", which = "both")

trimws(" Salut ", which = "left")

trimws(" Salut ", which = "right")


## 2) Fonction sur les dates ---- 

date <- "2025-01-27"

class(date)

date <- as.Date("2026-01-27")

date

class(date)


### formatage ----

format(date, "%d-%m-%Y")

format(date, "%d-%m-%y")


format(date, "%d/%m/%Y")

format(date, "%m:%d:%Y")


date_2 <- format(date, "%B %Y")


#Operation sur date ---- 

date + 10

date * 2

date_2 <- as.Date("2022-04-14")

date - date_2

class(date - date_2)

as.numeric(date - date_2)


date + date_2


### Extraction d'information sur les date 

months(date)

weekdays(date)


### Comapraison --- 

date >= date_2

date <= date_2

date >= date


date == date_2
date != date_2

### Fonction seqsur les dates ----

seq(from= 2,to= 50, by = 3)

#Jour
seq(from = as.Date("2024-01-01"), 
    to = as.Date("2024-12-31"),
    by = "day")

length(seq(from = as.Date("2024-01-01"), 
           to = as.Date("2024-12-31"),
           by = "day"))

#année

seq(from = as.Date("2020-01-01"), 
    to = as.Date("2024-12-31"),
    by = "year")


#month

seq(from = as.Date("2024-01-01"), 
    to = as.Date("2025-12-31"),
    by = "month")


#week

seq(from = as.Date("2024-01-01"), 
    to = as.Date("2025-12-31"),
    by = "week")


### date system ---- 

Sys.Date()

class(Sys.Date())

Sys.time()






