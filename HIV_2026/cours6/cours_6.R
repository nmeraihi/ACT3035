## Cours #6 -----

### Le retour au package dplyr -----

df_ass <-read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/assurance.csv", header = T)
head(df_ass)

dim(df_ass)

names(df_ass)


class(df_ass)


str(df_ass)


install.packages("dplyr")

library(dplyr)


### Ordonner ---- 

# desc = plus grand au plus petit 
arrange(df_ass, desc(nbsin))

# plus petit auplus grand 
arrange(df_ass, annee_veh)


#On peut ordonner avec plusieur colonne 
arrange(df_ass, desc(nbsin), annee_permis) %>% View()


### Selectionner des colonnes ----

df_ass_select <- select(df_ass, numeropol, type_territoire, nbsin)

#Enelever/Dropper des colonnes 
select(df_ass_select, -type_territoire)


### Filtrer les lignes ----

filter(df_ass, nbsin == 2) 

filter(df_ass, nbsin == 2, type_prof == "Médecin" ) 



filter(df_ass, nbsin == 2, type_prof == "Médecin" ) 


filter(df_ass, nbsin == 2, grepl("^A", type_prof)) 

# Commande %in% pour la condition ou 
filter(df_ass, nbsin == 2,  type_prof %in% c("Médecin", "Avocat")) %>% View()

# Ou
filter(df_ass, nbsin == 2 | myopie == "Y",  type_prof %in% c("Médecin", "Avocat"))

filter(df_ass, nbsin == 2 | myopie == "Y") %>% View()


### Ajout de nouvelle colonnes ---- 

mutate(df_ass, dummy = "xxxx")
mutate(df_ass, dummy = TRUE)

mutate(df_ass, age_veh = 2026- annee_veh)

mutate(df_ass, utilisation_newsplit = case_when(utilisation == "Loisir" ~ "Loisir",
                                                utilisation == "Travail-occasionnel" ~ "Travail",
                                                utilisation == "Travail-quotidien" ~ "Travail")) %>% View()

#TRUE ~ est comme le else
mutate(df_ass, utilisation_newsplit = case_when(utilisation == "Loisir" ~ "Loisir",
                                                utilisation == "Travail-occasionnel" ~ "Travail",
                                                TRUE ~ "Travail"))
### Summarize ---- 

summarise(df_ass, age_veh = 2026- annee_veh) 

summarise(df_ass, honda_count = sum(marque_voiture == "HONDA"), audi_count = sum(marque_voiture == "AUDI"), annee_veh_moyen = mean(annee_veh)) 



### L'opérateur Pipe %>% -----

df_ass %>% 
  select(numeropol, type_territoire, nbsin) %>% 
  head(10)


df_ass %>% 
  filter(type_prof %in% c("Médecin", "Technicien")) %>% 
  mutate(age_veh = 2026 - annee_veh) %>% 
  select(numeropol, type_territoire, age_veh, nbsin) %>% 
  View()



### Group by -----

#Cherchons nombre de sinistres totaux ainsi que les couts par territoire 

df_ass %>% 
  group_by(type_territoire) %>% 
  summarise(TotalNbSin = sum(nbsin), 
            Totcout = sum(cout1, cout2, na.rm = TRUE))


df_ass %>% 
  group_by(type_territoire) %>% 
  summarise(TotalNbSin = sum(nbsin), 
            Totcout = sum(cout1, cout2, na.rm = TRUE),
            count = n())


df_ass %>% 
  group_by(type_territoire) %>% 
  mutate(TotalNbSin = sum(nbsin)) %>%
  ungroup() %>% 
  mutate(age_veh = 2026 - annee_veh) %>% View()



## Jointure ----

df_demo <-read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/donnes_demo.csv", header = T)
df_demo

dim(df_demo)

df_auto <-read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/cars_info.csv", header = T)
df_auto

dim(df_auto)


all(df_demo$numeropol %in% df_auto$numeropol)

all(df_auto$numeropol %in% df_demo$numeropol)

#join 

merge(x = df_demo, y = df_auto, by.x = "numeropol", by.y = "numeropol") 


merge(x = df_demo, y = df_auto) # pas nécessaire de spécifier les clés



names(df_auto)[names(df_auto) == "numeropol"] <- "auto_numpol"
names(df_auto)

merge(x = df_demo, y = df_auto) %>% View() # Ca ne fonctionne pas! 


merge(x = df_demo, y = df_auto, by.x = "numeropol", by.y = "auto_numpol") 


#### Left join -----


x<-data.frame(nom=c("Gabriel", "Adel", "NM", "Mathieu", "Amine", "Mohamed"), 
              bureaux=c("5518", "4538", "5518", "5517", "4538", "4540"))
x

y<-data.frame(nom=c("Gabriel", "Adel", "JP", "Mathieu", "Amine"), 
              diplome=c("M.Sc", "Ph.D", "Ph.D", "Ph.D", "Ph.D"))
y


left_join(x,y, by = "nom")

#### Inner join ----

#Inner join va seulement considérer ce qui est en commun 
inner_join(x,y, by= "nom")

#### semi-join

semi_join(x,y, by = "nom")

#### anti-join

anti_join(x,y, by = "nom")


#Avec dplyr 

x %>% filter(nom != "Gabriel") %>% inner_join(y, by= "nom")


## Cours Graphique ---- 

### 1) Graphique de base en R ---- 

#### A) L'histogramme----

x <- rnorm(1000)
x

#Seulement une valeur numérique! 
hist(x)

#Option importante 

hist(x, 
     main = "Histogramme d'une simulation de 1000 loi normale N(0,1)",
     xlab = "Valeur de la simulation",
     ylab = "Fréquence",
     col = "darkorange2",
     border = "red")


#### B) Diagramme en barre (barplot) ----

couleur <- sample(c("bleu", "blanc", "rouge"), 100, replace = TRUE)

table(couleur)

#Ca ne fonctionne pas
barplot(couleur)

barplot(table(couleur))

#Option importante 

barplot(table(couleur), 
        main = "1000 Simulations parmi les couleurs",
        xlab = "Couleur",
        ylab = "Fréquence", 
        col = "cyan",
        border = "black",
        ylim = c(0,50)) #Intervalle de mon axe des y

#### C) Nuages de points ----- 

x <- rnorm(50)

y <- rnorm(50)

x
y

plot(x,y, 
     main = "Nage de point",
     col = "purple",
     pch = 0, 
     cex = 2,
     ylim = c(-4,4))

Ajout de ligne
abline(a=0, b=0, col = "red")

abline(a=2, b=0, col = "green", lty = 2, lwd = 5)


abline(a=-2, b=1, col = "darkblue", lty = 3, lwd = 1)

#Légende
legend("topright", #topleft, bottomleft, bottomright)
       legend = "Ligne droite",
       col = "red",
       lty = 1)

#### D) Boite a moustache (boxplot) -----

note <- c(12, 15, 8, 17, 14, 9, 11 ,18)

age_cat <- c("Jeune", "Jeune","Jeune","Jeune", "Vieu",  "Vieu",  "Vieu",  "Vieu" )


boxplot(note~ age_cat)


### 2) Introduction aux graphique ggplot ---- 

install.packages("ggplot2")

library(ggplot2)

mpg

data("mpg")
View(mpg)


#### A) Nuage de point -----

#Relation entre la taille du moteur displ et hwy l'éfficacité energitique du moteur 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(shape = 3, size = 5, color = "blue")+
  geom_smooth()+
  labs( title =  "Relation entre displ et hwy",
        x =  "Taille du moteur",
        y = "Efficacité du moteur")


#Nuage de point avec des catégories discrete

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = class))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(shape = class))

#Nuage de point avec des catégories numerique
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(alpha = cty))


#Plusieurs Nuage de point différent par catégorie

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point()+
  facet_wrap(~class, nrow = 4)


#### B) Diagramme en barre ---- 

ggplot(data= mpg, mapping = aes(x= class))+
  geom_bar()


ggplot(data= mpg, mapping = aes(x= 
                                  class))+
  geom_bar(fill = "blue")


#Bar segmenté 

ggplot(data= mpg, mapping = aes(x= class))+
  geom_bar(aes(fill = drv))

ggplot(data= mpg, mapping = aes(x= class))+
  geom_bar(aes(fill = drv), position = "dodge")


ggplot(data= mpg, mapping = aes(x= class))+
  geom_bar(aes(fill = drv), position = "dodge")+
  coord_flip()


#Statistique 


data <- data.frame( 
  groupe = c(rep("1", 5), rep("2", 5)),
  valeur = runif(10,50,100))
View(data)


#sum de valeur

ggplot(data = data, mapping = aes(x= groupe, y = valeur))+
  geom_bar(stat = "identity")


#count 


ggplot(data = data, mapping = aes(x= groupe))+
  geom_bar()


#moyenne


data_moyenne <- data %>% 
  group_by(groupe) %>% 
  summarise(valeur_moyen = mean(valeur))
data_moyenne 

