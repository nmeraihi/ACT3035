un_bonjour <- "Bonjour"
salutations <- c("Bonjour", "Hi", "hey", "Salam")
salutations_e <- c("Bonjourë", "Hi", "hëy", "Salam")
mot <- "world"
question <- "Quel est le language de programmation préféré des actuaires?"
question_e <- "Quel est le language de programmation prëfërë des actuaires?"

reponse <- "Rrrrrrrr"

substr(question, 6, 8)

l <- substr(question, 4, 4)
s <- substr(question, 7, 7)
paste(l,s,sep = "")

grep("ë", salutations_e)

grep("ë", salutations_e, value = T)

strsplit(question_e,split = " ")


question <- "Quel est le language de programmation préféré des actuaires? autres que actuaires"
sub("actuaires", "RH", question)

gsub("actuaires", "RH", question)

# les fonctions des dates et heures
Sys.Date()

Sys.time()

time_1 <- Sys.time()
time_1

time_1
time_1+1

as.numeric(time_1)

as.POSIXlt.POSIXct(1558994841)
as.character(Sys.Date())

Sys.Date()-1:7

weekdays(as.Date("2019-05-06")+1:7)

library(lubridate)
Sys.setlocale(locale = "en_CA.UTF-8")

?Sys.setlocale

month(Sys.Date())
months(Sys.Date())


Sys.Date()+1:7


time_1
time_2 <- Sys.time()

system.time()

difftime(time1 =time_1, time2 = time_2, units = "sec")

abs(as.numeric(difftime(time1 =time_1, time2 = time_2, units = "sec")
))

# Manipulation de fichiers


file.exists("maison_montreal.csv")

file.rename("maison_montreal.csv", "maison_montreal_2.csv")

ceiling(as.numeric(Sys.time()))


paste(paste("maison_montreal", 
      ceiling(as.numeric(Sys.time())),
      sep = "_"),".csv", sep = "")

file.create("test.txt")

list.files()


example(sample)
sample(1:25, 30, replace = T, prob = )

sample(c("P","F"), size = 4, replace = T, prob = c(.3,.7))


?load

