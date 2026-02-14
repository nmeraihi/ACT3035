#Exercice fonction ----

## Exercice #1 ---- 

#Créez une fonction, min_2(vecteur), qui extrait le deuxieme plus petit élément d'un vecteur numérique

numeric_vec <- c(3,6,12,0,6,50,2,-2)


min_2 <- function(vecteur) {
  vecteur_trie <- sort(vecteur)
  return(vecteur_trie[2])
}

min_2(numeric_vec)


#Autre facon , version 2



min_2 <- function(vecteur) {
  
  #On retire le minimum
  vecteur_nomin <- vecteur[vecteur != min(vecteur)]
  
  #On retourne le nouveau minimum 
  return(min(vecteur_nomin))
}

min_2(numeric_vec)




##Exercice 2 ----
# Créez une fonction ,count_e(vecteur), qui compte le nombre d'éléments avec au moins un "e"

exemple_char <- c("elephant", "Ecole", "rene", "R", "ensemble")


count_e <- function(vecteur) {
  sum(grepl("e", vecteur))
}

count_e(exemple_char)
