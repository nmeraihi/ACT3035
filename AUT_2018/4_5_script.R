un_bonjour<-"Bonjour"
salutations<-c("Bonjour","Hi","Hey","Salam")
mot<-"World"

question<-"Quel est le langage de programmation préféré des actuaires? "
réponse<-"Rrrrrrrrrr"

substr(question, 6, 8)
nchar(question)

substr(question, nchar(question)-9, nchar(question))

substr(salutations, 1,2)

paste(salutations, "ACT3035", "030", sep = "_")

paste("cout", 1:10, sep = "_")

library(MASS)

head(Cars93)

colnames(Cars93)
length(colnames(Cars93))

paste("X", 1:length(colnames(Cars93)), sep = "_")

Cars93

colnames(Cars93) <- paste("X", 0:(length(colnames(Cars93))-1), sep = "_")
head(Cars93)
length(colnames(Cars93))

salutations
grep("H", salutations, value = T)

grep("New", state.name, value=T)


question

strsplit(question, " ")

question2 <- strsplit(question, " ")
length(question2)

question2

sub("actuaires", "marsiens", question)


question3<-"Quel est le langage de programmation préféré des actuaires des la société des actuaires? "

sub("actuaires", "marsiens", question3)

gsub("actuaires", "marsiens", question3)

Sys.Date()+1
Sys.time()
time1 <- Sys.time()
time_1

class(Sys.time())

as.numeric(Sys.time())
as.numeric(Sys.time())


mesDates <- Sys.Date()- 1:10
mesDates
weekdays(mesDates)

Sys.setlocale()

require("lubridate")
Sys.setlocale(locale="fr_FR.UTF-8") #en_CA.UTF-8
weekdays(mesDates)


seq(1,30, 5)

seq(as.Date("2018-09-24"), as.Date("2018-10-31"), "week")
seq(as.Date("06/09/17", "%d/%m/%y"), to = as.Date("13/12/17","%d/%m/%y"), "day")

format(as.Date("2018-09-24"))
as.Date("2018-09-24")


time_1 <- Sys.time()
time_1
time_2 <- Sys.time()
time_2

as.Date(time_1)-as.Date(time_2)

difftime(time1 = time_1, time2 = time_2,units = "mins")
?difftime

setwd("~/Desktop/Cour3")
file.exists("1000_HF.csv")
file.rename("1000_HF.csv", "1000_HF_2.csv")
file.create("vide.txt")
list.files()
list.dirs()

file.info("1000_HF_2.csv")$size

vec_boo<-c(T,F,T,T,F,T)
as.numeric(vec_boo)

vec <- 1:10
vec
vec[1]<5
vec[5]>=5
vec>6
vec[vec>6]

vec[(vec<3)|(vec>=8)]

if(vec[1]>3){print("cet élément est plus grand à 3")}else {print("cet élément est plus petit à 3")}

if(vec[1]>3){print("cet élément est plus grand que 3")} else {print("cet élément n'est pas plus grand que 3")}


age <- 25
if(age>18 && age<=35){cat_age<-"jeune"}else {
  cat_age<-"trop_vieux_ou_trop_jeun"}

cat_age



Ville_1 <- "Toronto"
if(Ville_1=='Montréal'){Province_1<-"Québec"} else if (Ville_1=='Toronto'){
  Province_1<-"Ontario" }else {Province_1<-"autre"}
Province_1

Ville<-c("Montréal","Vancover","Toronto")
?ifelse

x <- c(6:-4)
x
sqrt(x)
ifelse(x>=0, sqrt(x), 999)

Ville <- c("Toronto", "Laval", "Brossard")
province<-ifelse(Ville=="Toronto","Ontario",
                 ifelse(Ville=="Montréal","Québec","autre"))
province

for (i in 8:19){
  if (i==17){next}
  print(paste("jour", i, sep = "_"))
}

for (i in 8:19){
  if (i==10){break()}
  print(paste("jour", i, sep = "_"))
}

Sys.time()

moyennes<-NULL
a <- system.time(
for (i in 1:20000){
  mu<-mean(rnorm(100))
  moyennes<-rbind(moyennes, mu)
})
a

moyennes <-numeric(length = 20000)
b <- system.time(
  for (i in 1:20000){
    mu<-mean(rnorm(100))
    moyennes[i] <- mu
  })
b


NotrePremiereFonction <- function(arg1=1,arg2=1){
  if(arg2==0){print("arg2 doit être différent de 0")}else
  {qqch <- arg1/arg2
  return(qqch)}
}
NotrePremiereFonction()

NotrePremiereFonction(2,0)

























