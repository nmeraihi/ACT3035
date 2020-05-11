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



