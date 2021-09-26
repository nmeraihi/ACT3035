mat_2 <- matrix(1:40, nrow = 5)
mat_2
mat_3 <- matrix(41:80, nrow = 5)
mat_3
rbind(mat_2, mat_3)
cbind(mat_2, mat_3)
array(1:24, dim=c(3,4,2))

# les listes
?plot
maListes <- list(vecteur=c(1,2,7,9), 
                 marque=c("BMW", "Honda", "Toyota"),
                 bool=c(T,F))
?list
maListes
maListes$marque
maListes[2]
maListes[[2]]


acciident_route <- read.csv("C:/Users/meraihi_n/Downloads/collisions_routieres.csv")
acciident_route <- read.csv("C:/Users/meraihi_n/Downloads/collisions_routieres.txt", fileEncoding="utf-8")
?read.csv

head(acciident_route)


is.na(acciident_route)

acciident_route$GRAVITE

install.packages("dplyr")
library(dplyr)
# summarise(acciident_route)
# acciident_route
# View(acciident_route)

summary(acciident_route)
max(acciident_route$NB_DECES_PIETON)
head(arrange(acciident_route, 
        desc(NB_DECES_PIETON), 
        desc(NB_BLESSES_PIETON)))

head(select(acciident_route, 
       NB_DECES_PIETON,
       NB_BLESSES_PIETON))

df_select <- select(acciident_route, 
                    NB_DECES_PIETON,
                    NB_BLESSES_PIETON)

head(arrange(df_select, 
        desc(NB_DECES_PIETON), 
        desc(NB_BLESSES_PIETON)))



filter(acciident_route, 
       JR_SEMN_ACCDN=="VE", 
       NB_VEH_IMPLIQUES_ACCDN!=0)


mutate(acciident_route, 
       NB_VICTIMES_TOTAL/NB_VEH_IMPLIQUES_ACCDN)


acciident_route %>%
  select(NB_DECES_PIETON, 
         NB_BLESSES_PIETON,
         JR_SEMN_ACCDN,
         NB_VEH_IMPLIQUES_ACCDN) %>%
  filter(JR_SEMN_ACCDN=="VE", 
         NB_VEH_IMPLIQUES_ACCDN!=0) %>% 
  head


acciident_route %>% 
  select(JR_SEMN_ACCDN,
         NB_VEH_IMPLIQUES_ACCDN) %>% 
  group_by(JR_SEMN_ACCDN) %>% 
  summarise(moyenne_veh_accident=mean(NB_VEH_IMPLIQUES_ACCDN))
  

df_sommaire_bicy_mtl <- acciident_route %>% 
  select(REG_ADM, 
         nb_bicyclette, 
         AN) %>% 
  filter(REG_ADM=="Montréal(06)") %>% 
  group_by(AN) %>% 
  summarise(somme_mtl_annee=sum(nb_bicyclette)) %>% 
  arrange(desc(AN))

setwd("C:/Users/meraihi_n/Desktop/ACT3035")
write.csv(df_sommaire_bicy_mtl, 
          file = "df_sommaire_bicy_mtl.csv",
          row.names = F)
?write.csv

acciident_route %>% 
  select(REG_ADM, 
         nb_bicyclette, 
         AN) %>% 
  filter(REG_ADM=="Montréal(06)") %>% 
  group_by(AN) %>% 
  summarise(somme_mtl_annee=sum(nb_bicyclette)) %>% 
  arrange(desc(AN))
