library(dplyr)
# install.packages("dplyr")
?dplyr
assurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/assurance.csv")
head(assurance)
View(assurance)
select()
dplyr::select()
?select
ds_assurance_5 <- select(assurance,
       numeropol, 
       langue, 
       alimentation, 
       marque_voiture,
       sexe)

df_assurance_5 <- dplyr::select(assurance,
                         numeropol, 
                         langue, 
                         alimentation, 
                         marque_voiture,
                         sexe)
dim(filter(df_assurance_5,sexe=="F"))
dim(filter(df_assurance_5,sexe=="M"))

# piping

df_exemole <- assurance %>% 
  mutate(somme_cout_1_cout_2=cout1+cout2) %>% 
  select(numeropol, 
                     langue, 
                     alimentation, 
                     marque_voiture,
                     sexe,
         somme_cout_1_cout_2) %>% 
  filter(sexe=="F") %>% 
  # dim() %>% 
  filter(marque_voiture=="RENAULT") %>%
  arrange(desc(somme_cout_1_cout_2)) %>% 
  View()
?arrange
summary(assurance)


mutate(assurance, somme_cout_1_cout_2=cout1+cout2)

# assurance %>% select(sexe, cout1) %>% 
# summarise(cout1_moy=round(mean(cout1,na.rm=T),2))

summarise(assurance ,cout1_moy=round(mean(cout1,na.rm=T),2))


assurance %>% group_by(sexe, type_prof) %>% 
  summarise(cout1_moy=mean(cout1, na.rm = T))

assurance %>% group_by(type_prof, sexe) %>% 
  summarise(cout1_moy=mean(cout1, na.rm = T))

# df_cars_info <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/cars_info.csv")
df_pmt_details <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/pmt_details.csv")
df_police_assurance <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/police_assurance.csv")

left_join(df_pmt_details,
          df_police_assurance, 
          by="numeropol")


?substr()
char <- "Substrings of a Character Vector"
substr(char, 11, 14)

nchar(char)

paste("Bonjour", "ACT3035", sep = "_")


?grep()

grep("[a-z]", letters)

strsplit(paste("Bonjour", "ACT3035", sep = "_"), "_")

Sys.Date()
Sys.time()

temps_1 <- Sys.time()

temps_2 <- Sys.time()

temps_2-temps_1


temps_1+180

class(temps_1)

weekdays(temps_1)

# Sys.setLanguage("en")

months(temps_1)

difftime(temps_1, temps_2)

getwd()

file.exists("assurance.csv")
file.exists("df.csv")
df <- read.csv("assurance.csv")
file.rename("df.csv", "dataFrame.csv")


write.csv(df_assurance_5,
          "df_assurance_5.csv",
          row.names = F)


file.create("vide.txt")

file.info("df_assurance_5.csv")

save(df_assurance_5, file = "df_assurance_5.RData")
load("df_assurance_5.RData")

df_assurance_5







