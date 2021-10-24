vecteur <- 1:10
vecteur
vecteur[3]<vecteur[4]
vecteur[3]>=vecteur[4]

for (i in 1:10) {
  print("Bonjour")
}

for (i in 1:10) {
  if (i==5) {
    break
  }
  print(paste("i est egale a ", i ))
}


i=0
while (i<5) {
  i=i+1
  print(paste("i est egale a ", i ))
}


fontionPerso <- function(x, y){
  # l'argument x est une valeur numeric
  # l'argument y est une valeur numeric
  # Cette fonction sert a addition deux vals
  # retourne la somme de x et y
  
    if (is.numeric(x) & is.numeric(y)) {
    reultat1=x+y
    return(reultat1)
  }else{
    print("La valeur doit etre numeric")
  }
}

fontionPerso



library(dplyr)
?select



fontionPerso("a",2)
fontionPerso(5,2)
fontionPerso(5,"a")

is.numeric(x) & is.numeric("a")


df <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/AAPL.csv")
save(df, file = "df.RData")

load("df.RData")

write.csv(df, "df.csv")

library(nycflights13)

write.csv(flights, "flights.csv")


# install.packages("ggplot2")
library(ggplot2)
?ggplot
?mpg

ggplot(mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  geom_smooth(mapping = aes(x=displ, y=hwy))+
  ggtitle("Titre du graphique")+
  xlab("axe des x")+
  ylab("axe de y")


x <- ggplot(mpg)
x+
  geom_point(mapping = aes(x=displ, y=hwy))+
  geom_smooth(mapping = aes(x=displ, y=hwy))+
  ggtitle("Titre du graphique")+
  xlab("axe des x")+
  ylab("axe de y")



geom



?geom_smooth
?ggtitle

























