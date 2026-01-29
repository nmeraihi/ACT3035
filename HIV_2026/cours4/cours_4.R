# Cours #4 ----- 


## Modulo ---- 

10 %% 2 

10 %% 3


1:5 %% 2


## Rappel test d'équation ---- 

vec <- 1:10
vec

vec[1] > 5 

vec[2] == 2


vec[2] != 3

!(vec[2] != 3)
!(vec[2] <= 3)


vec[2] != 2 & vec[7] != 7


vec[2] == 2 | vec[7] == 10


## 1) déclaration if, if else et else ---- 

vec

if(vec[1] == 1){
  print("Cet élément est égal a 1")
}


if(vec[1] > 3){
  print("Cet élément est plus grand que 3")
}


if(vec[1] > 3){
  print("Cet élément est plus grand que 3")
} else{
  print("Cet élément n'est pas plus grand que 3")
  
}

x <- 2 

if(vec[3] > x){
  print(paste("Cet élément est plus grand que", x))
} else {
  print(paste("Cet élément n'est pas plus grand que", x))
}

### Création d'objet ---- 

age <- 25

if(age > 50){
  cat_age <- "Vieu"
} else {
  cat_age <- "Jeune"
}

cat_age

### else if ---- 

age <- 5

if(age > 50){
  cat_age <- "Vieu"
} else if(age<=12) {
  cat_age <- "Enfant"
} else{
  cat_age <- "Jeune"
}

cat_age


#Autre exemple 


ville <- "Toronto"

if(ville == "Montreal"){
  province <- "Quebec"
} else{
  province <- "Autre"
}

province



if(ville == "Montreal"){
  province <- "Quebec"
} else if(ville =="Toronto" | ville =="Ottawa") {
  province <- "Ontario"
} else if(ville == "Vancouver"){
  province <- "BC" 
} else{
  province <- "Autre"
}

province



## Fonction ifelse pour les vecteur ----

ville <- c("Montreal", "Toronto", "Vancouver")


province <- ifelse(ville == "Toronto",  "Ontario", "Autre" )
province

province <- ifelse(ville == "Toronto",  "Ontario", 
                   ifelse(ville=="Montreal", "Quebec", "Autre") )

province <- ifelse(ville == "Toronto",  ifelse(nchar(ville) == 7, "Ontario_2", "Ontario"), 
                   ifelse(ville=="Montreal", "Quebec", "Autre") )
province


## For loop, boucle en R ---- 

for(i in 1:5){
  print("Nous sommes dans le cours ACT 3035")
}


for(i in 1:5){
  print(paste("C'est l'itération", i))
}


for(i in 100:110){
  print(paste("C'est l'itération", i))
}


for(i in seq(2,10,2)){
  print(paste("C'est l'itération", i))
}


for(i in 1:5){
  i_carre <- i**2
  print(paste("C'est l'itération", i, "le carré de", i, "est", i_carre))
}


for(i in 1:5){
  
  i_carre <- i**2
  print(paste("C'est l'itération", i, "le carré de", i, "est", i_carre))
  
  if(i ==5){
    print("C'est la fin de ma boucle")
  }
  
}

#### Next ----

for(i in 1:5){
  
  if(i %% 2 !=0){next}
  
  print(paste("C'est l'itération", i))
  
}

#### Break ----

for(i in 1:5){
  
  if(i %% 2 ==0){break}
  print(paste("C'est l'itération", i))
  
}


## déclaration While ----

i <- 1


while(i < 5){
  print(paste("C'est l'itération", i))
  i <- i *1.5
}


#Ne pas refaire a la maison !! 
i <- 1

while(i < 5){
  print(paste("C'est l'itération", i))
}


i <- 0
while(i < 5){
  print(paste("C'est l'itération", i, Sys.time()))
  i <- i + 0.1
}


i <- 1
t <- 1
t_0 <- Sys.time()

while(i < 2){
  print(paste("C'est l'itération", i, Sys.time()))
  if(Sys.time() - t_0 > 3){break}
  t = t+1
  print(paste("C'est l'itération", t, Sys.time()))
}

### repeat/break  ---- 


n <- 1

repeat{
  n <- n+3
  print(mean(rnorm(10, 0, 1)))
  if(n>= 7){break}  
}



### Construction de vecteur a l'aide de boucles ----

moyennes <- numeric(length = 200)
moyennes
length(moyennes)

for(i in 1:200){
  
  if(i %% 2 == 0){
    
    mu_normal <- mean(rnorm(100))
    
    moyennes[i] <- mu_normal
    
  }else{
    mu_exp <- mean(rexp(100, rate = 1/100))
    moyennes[i] <- mu_exp
  }
}
moyennes

### boucle dans boucle ----

matrix <- matrix(1:16, nrow = 4)

matrix


for(i in 1:nrow(matrix)){
  for(j in 1:ncol(matrix)){
    
    if(i == j){
      matrix[i,j] <- 0
      
    }else if(j > i){
      
      matrix[i,j] <- matrix[i,j] + 5
      
    } else{
      
      matrix[i,j] <- matrix[i,j] - 5
    }
    
    
    
    
  }
}
matrix



## 2) Creation de fonction ---- 

#Fonction de deux éléments

somme <- function(x, y){
  z <- x + y
  
  return(z)
  
}

somme(2,4)

somme <- function(x, y){
  
  return(x+y)
  
}

somme(2,4)

#Valeur par default dans la fonction
somme <- function(x = 1, y = 1){
  
  return(x+y)
  
}

somme()
somme(2,4)

somme("2", 2)

somme <- function(x = 1, y = 1){
  
  if(is.numeric(x) & is.numeric(y)){
    return(x+y)
    
  }else {
    return("Veuillez vérifier vos argument")
  }
  
}
somme("2", 2)
somme(3, 2)

somme(c(1,2), c(1,2))


#Retourner plusieurs éléments/un vecteur

operation <- function(x,y){
  
  if(is.numeric(x) & is.numeric(y)){
    return(c(x+y, x-y, x*y, x/y))
    
  }else {
    return("Veuillez vérifier vos argument")
  }
  
}

operation(2,4)



operation_l <- function(x,y){
  
  if(is.numeric(x) & is.numeric(y)){
    list(x+y, x-y, x*y, x/y)
    
  }else {
    return("Veuillez vérifier vos argument")
  }
  
}
operation_l(2,4)

operation <- function(x,y){
  
  if(is.numeric(x) & is.numeric(y)){
    return(c("somme" = x+y, "soustraction" =  x-y,"multi" = x*y,"division" = x/y))
    
  }else {
    return("Veuillez vérifier vos argument")
  }
  
}
operation(2,4)


# inspecter la fonction

operation

formals(operation)


### Exercice création de function ---- 

fact_maison <- function(x){
  
  if(x==0){
    return(1)
  }else{
    
    x_temp <- 1
    
    for(i in 1:x){
      x_temp <- x_temp * i
    }
    fact_resultat <- x_temp
    
    return(fact_resultat)
  }
}
fact_maison(3)
fact_maison(0)


x_temp <- 1
x <-  6
for(i in 1:x){
  print(x_temp)
  x_temp <- x_temp * i
}

fact_maison_while <- function(x){
  
  i <- 1 
  
  x_temp <- 1
  
  while(i <= x){
    
    x_temp <- x_temp*i
    i <- i + 1
  }
  
  return(x_temp)
}

fact_maison_while(5)

fact_maison_while(3)

fact_maison(0)




## Exemple sur des caractere ----


codes <- c("a 12", "B007 ", "c3", " AA1", "D1234", "98E ")

#Une fonction qui eneleve les espace, met en majuscule et valide qu'il y a
#une majuscule suivi de deux chiffres, si pas valide on retourne NA, si valide on retourne le code


clean_codes <- function(x){
  
  # 1 suprimer espace 
  x <- gsub(" ", "", x)
  
  # 2 mettre tout en majuscule 
  
  x <- toupper(x)
  
  # Valider le format --- 1 majuscule suivi de deux chiffres
  
  ok <- grepl("[A-Z][0-9]{2}", x)
  
  
  return(ifelse(ok == TRUE, x, NA))
  
  
}


clean_codes(codes)    





























