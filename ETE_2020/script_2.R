vecteur <- c(1,2,3,4,5)
vecteur <- 1:12
vecteur
print(vecteur)
vecteur_deci <- 12.5:27.8
vecteur_deci

vect_seq <- seq(12.5,28.8,5)
vect_seq
?seq
example(seq)

vecteur_maqrue_voit <- c("tesla", "bmw", "honda", "toyota", "Nissan")
vecteur_maqrue_voit[2]
vecteur_maqrue_voit[c(2,3)]
vecteur_maqrue_voit[2:4]
vecteur_maqrue_voit[-c(2,3)]
vecteur_maqrue_voit[-(2:4)]


vecteur_prix_voit <- c(55000, 35000, 18000, 23000, 12000)


vecteur_voit_autonom <- c(T, F, F, F, F)

vect_port_assur <- c(vecteur_maqrue_voit, 
                     vecteur_prix_voit,
                     vecteur_voit_autonom)

vect_port_assur


vect_MSRP <- vecteur_prix_voit

vect_MSRP*1.05*1.095

vect_MSRP_tx <- vect_MSRP*1.05*1.095

vect_MSRP_tx == vect_MSRP

all(vect_MSRP_tx == vect_MSRP)
!all(vect_MSRP_tx == vect_MSRP)

"bonjour"!="bonjour"

rep("bonjour act3035", 25)

?rep

x <- c(1,2,5,7,0,2,4,1,5)
y <- seq(1.1, 2, .1)
z <- x**2/-.5
x
y
z


length(x)
min(x)
max(x)

min(x, z)

mean(x)
sd(x)
var(x)

A <- matrix(1:12, 4,3)
A <- matrix(1:12, nrow=4,ncol=3, byrow = T)
A

t(A)







