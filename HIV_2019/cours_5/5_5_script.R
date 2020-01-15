
taille <- 20000
moyenne <- NULL
a <- system.time(
  for (i in 1:taille){
    mu <- mean(rnorm(100))
    moyenne <- rbind(moyenne, mu)
  }
)
a
# vecteur défini
moyenne <- numeric(length = taille)
b <- system.time(
  for (i in 1:taille){
    mu <- mean(rnorm(100))
    moyenne[i] <- mu 
  }
)
b
a/b

# Les fonction
sommeXY <- function(x,y){
  return(x+y)
}
sommeXY(7,87)


operation_l <- function(x=1,y=1){
  # cette fonction calcule la somme, la multiplicatio
  # et la division de deux éléments
  # ARGS:
  #   x: l avaleur du preemier élément
  #   y: la vcaleur du 2e élément
  # Rtourne:
  #   une liste de bla bla bla
  if(is.numeric(x) & is.numeric(y)){
    return(list(x+y, y*x, y/x))
  }else{
    print("Veuillez vérifier que 
          vos arguments sont numériques")
  }
}
operation_l(8,87)
operation_l(8,TRUE)
operation_l()


# 
x <- matrix(rnorm(100), ncol = 10)
save(x, file = "x.RData")
rm(x)
x


load("x.RData")
x
x*2


# ggplot2
library(ggplot2)
?mpg
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))


data <- data.frame(
  session=factor(c("A17","A17","A17","H18","H18","H18","E18","E18","E18")),
  exmen=c("examen_1","examen_2","examen_3","examen_1","examen_2","examen_3","examen_1","examen_2","examen_3"),
  moyenne=c(20,24,26,21,22,23,18,20,19),
  ordre=c(c(rep(1,3), rep(2,3), rep(3,3)))
)
View(data)
a <- ggplot(data, aes(x=exmen, y=moyenne, fill=session))
a+geom_bar(position = position_dodge(), stat = "identity")+
  ggtitle("Évolution de la moyenne \ndu cours ACT3035")



c(rep(1,3), rep(2,3), rep(3,3))



