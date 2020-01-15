
# "https://raw.githubusercontent.com/nmeraihi/data/master/1000_cartes.csv"
# "https://raw.githubusercontent.com/nmeraihi/data/master/NFLX.csv"


path<-"https://raw.githubusercontent.com/nmeraihi/data/master/"
itw <- paste(path, "ITW.csv", sep = "")
df <- read.csv(itw)

exemple_2 <- paste(path, "exemple_2.txt", sep = "")
df_ex2 <- read.csv(exemple_2)
head(df_ex2)

library(dplyr, warn.conflicts = F)
df_ex2
arrange(df_ex2, desc(bpm))
colnames(df_ex2)

select(df_ex2, km, bpm)
library(MASS)
filter(Cars93, Cylinders==8)
table(Cars93$Cylinders)
colnames(Cars93)
?filter
filter(Cars93, Manufacturer=="Cadillac")
library(actuar)

colnames(Cars93)

mutate(Cars93, Max_Min=Max.Price-Min.Price)

summarise(Cars93, Min_moyen=mean(Min.Price),
          Max_moyen=mean(Max.Price),
          Prix_moyen=mean(Price))


View(Cars93)

select(Cars93,Manufacturer, Price, Horsepower)
?group_by

path<-"https://raw.githubusercontent.com/nmeraihi/data/master/"
assurance <- paste(path, "assurance.csv", sep = "")
df_ass <- read.csv(assurance)
View(df_ass)

colnames(df_ass)

df_ass %>%
  group_by(type_territoire) %>%
  summarise(TotalNbSin=mean(nbsin),
            TotaCout=mean(cout1, na.rm=T))

ville_1 <- "Montreal"
if(ville_1=="Montreal"){province <- "Quebec"}else
{province <- "autre"}
province

ville_1 <- "Toronto"
province

ville <- c("Montreal", "Toronto", "Laval")
province <- ifelse(ville=="Toronto", "Ontario",
                   ifelse(ville=="Montreal", "Quebec", "autre"))
province

set.seed(123)
moyenne <- NULL
for (i in 1:1000){
  mu <- mean(rnorm(100))
  moyenne <- rbind(moyenne, mu)
}
plot(moyenne)


set.seed(123)
moyenne <- NULL
temps_1 <- system.time(
for (i in 1:20000){
  mu <- mean(rnorm(100))
  moyenne <- rbind(moyenne, mu)
})
temps_1










