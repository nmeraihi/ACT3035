# apply
m <- matrix(1:12,nrow = 3)
rowSums(m)
apply(m, c(1,2), log)
v1 <- 1
v2 <- 2:15
v3 <- 97:105

x <- array(1:24, dim = c(2,3,4))
x

maListe <- list(noms=c("Mike", "Jessica", "Noureddine"),
                Vehicule=c("BMW", "Civic", "Tesla", "Toyota"),
                Prix=c(30, 15, 50), 
                sexe=c(T, F, T))


# rgression <- list(resultst=..., predictions=..., graph=...)



