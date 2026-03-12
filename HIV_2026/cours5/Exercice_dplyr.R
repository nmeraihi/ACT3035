


library(dplyr)

etudiants <- data.frame(
  nom = c("Alice", "Bob", "Charlie", "David", "Emma", "Fatima", "George", "Hana", "Samy"),
  sexe = c("F", "M", "M", "M", "F", "F", "M", "F", "M"),
  age = c(22, 19, 24, 21, 23, 20, 22, 25,NA),
  note = c(15, 8, 12, 17, 14, 9, 11, 18, 19)
)

# 1. Effectuer A), B) et C) a l'aide de l'opérateur pipe 
# A) Sélectionner uniquement les colonnes nom et note.

# B) Filtrer les étudiants ayant une note ≥ 12 ou un age égal à 20.
# 
# C) Trier les étudiants par note décroissante.






# 2. Effectuer A), B) et C) a l'aide de l'opérateur pipe
# 
# A) Créer une nouvelle variable "admis" :
#   
#   TRUE si note ≥ 10, FALSE sinon
# 
# B) Ajouter une variable "mention" :
#   
#   "Très bien" si note ≥ 16, "Bien" si note entre 14 et 15 ,"Passable" si note entre 10 et 13
#   "Ajourné" sinon
#
# C) Enlever les observations ou l'age est manquant  








# 3. Effectuer A), B) et C) a l'aide de l'opérateur pipe
# 
# A) Calculer la moyenne et l'ecart type, des notes par sexe.
# 
# B) Calculer la note maximale et minimal par sexe
# 
# C) le nombre d’étudiants par sexe.



# 4. Combien d’étudiantes (F) ont une note ≥ 14 ?






# 5. Ajouter la variable filiere au tableau etudiants à l’aide d’une jointure, 

filieres <- data.frame(
  nom = c("Alice", "Bob", "Charlie", "David", "Emma", "Fatima", "George"),
  filiere = c("Stat", "Eco", "Stat", "Info", "Eco", "Stat", "Info")
)
# -->Le tableau final doit contenir toutes les colonnes des deux tables
# -->Aucune obervation du data etudiant ne devrait être supprimer.
