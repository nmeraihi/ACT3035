# accidents <- read.csv("C:/Users/meraihi_n/Downloads/rapports-accident-2019.csv",encoding = "utf-8")
# View(accidents)
# ?read.csv


departments <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/hr/departments.csv")
employees <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/hr/employees.csv")
job_history <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/hr/job_history.csv")
jobs <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/hr/jobs.csv")
locations <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/hr/locations.csv")
regions <- read.csv("https://raw.githubusercontent.com/nmeraihi/data/master/hr/regions.csv")

View(locations)

?read.csv
# install.packages("dplyr")
library(dplyr)

df_emp_depart <- left_join(employees, departments, by="DEPARTMENT_ID") %>% 
  select(EMAIL, DEPARTMENT_NAME) %>% 
  filter(DEPARTMENT_NAME=="Executive")



colnames(df_emp_depart)


?paste

char_paste <- paste("Bonjour", "tout le monde", sep = "*")

nchar(char_paste)

aujourd <- Sys.Date()
Sys.time()

aujourd+7
as.numeric(aujourd)

as.Date(18899, origin = "1970-01-01")
?as.Date


?seq
seq(from=aujourd, 
    to= as.Date("31/12/21", "%d/%m/%y"), 
    by="day")
date_fin <-  as.Date("31/12/22", "%d/%m/%y")
date_fin

aujourd

difftime(aujourd, date_fin)

setwd("C:/Users/meraihi_n/Desktop/ACT3035")

file.exists("rapports-accident-2019.csv")
file.rename("rapports-accident-2019.csv", "rap-accid-2019.csv")
list.files()

file.info("rap-accid-2019.csv")














