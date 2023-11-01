file_url <- "https://raw.githubusercontent.com/nmeraihi/data/master/CASdatasets/data/fremotor1prem.rda"
setwd("C:/Users/meraihi_n/Desktop/ACT3035")
local_path <- "fremotor1prem.rda"
download.file(url = file_url,
              destfile = local_path, 
              method = "auto")
load(local_path)
load("fremotor1sev.rda")
# load("Downloads/fremotor1sev.rda")
head(fremotor1prem)

library(tidyverse)
tbl_premium <- fremotor1prem %>% 
  mutate(Malus=BonusMalus>100, IDpol=as.character(IDpol)) %>% 
  select(IDpol,
         DrivAge,
         DrivGender,
         MaritalStatus,
         PayFreq,
         JobCode,
         VehAge,
         VehClass,
         VehPower,
         VehGas,
         VehUsage,
         Garage,
         Malus)

head(tbl_premium)
tbl_calim <- fremotor1sev %>% 
  filter(Guarantee=="Windscreen") %>% 
  mutate(IDpol=as.character(IDpol)) %>% 
  select(-Guarantee)

tbl_severity <- tbl_calim %>% 
  inner_join(tbl_premium, by="IDpol") %>% 
  select(-IDpol, -IDclaim)

tbl_frequency <- tbl_calim %>% 
  group_by(IDpol) %>% 
  summarise(claim_count=n()) %>% 
  ungroup() %>% 
  right_join(tbl_premium, by="IDpol") %>% 
  mutate(claim_count=coalesce(claim_count, 0L)) %>% 
  select(-IDpol)
  
tbl_claim_free <- tbl_frequency %>% 
  mutate(claim_free=claim_count>0) %>% 
  select(-claim_count, -Malus)

tbl_calim_missing_pol <- anti_join(
  tbl_calim,
  tbl_premium,
  by="IDpol"
)

save(file = "frenchMotor.rda",
     tbl_severity,
     tbl_frequency,
     tbl_claim_free)

suspect_age <- function(x,
                        max_age=90){
  return(x>max_age)
}


# On remarque que certains assurés ont plus que 97
tbl_claim_free %>% 
  filter_at(vars(tidyselect::contains("age",ignore=T)),
            any_vars(suspect_age(.))) %>% 
  select_at(vars(tidyselect::contains("age",ignore=T)))


vec_any_na <- function(x){
    x %>% 
    is.na() %>% 
    any()
}

# Mettre les valeurs manquantes dans un df appele tbl_missing
tbl_mising <- map_lgl(tbl_severity, vec_any_na) %>% 
  enframe(value="has_na") %>% 
  mutate(
    class=map_chr(tbl_severity, class)
  )

# Random Forest

tbl_severity_mod <- tbl_severity %>% 
  mutate(
    Malus=as.factor(Malus),
    OccurDate=as.double(OccurDate)
  )
tbl_claim_free_mod <- tbl_claim_free %>% 
  mutate(
    claim_free=as.factor(claim_free)
  )
install.packages("randomForest")
library(randomForest)

tbl_severity_mod <- tbl_severity_mod %>% na.roughfix()
tbl_claim_free_mod <- tbl_claim_free_mod %>% na.roughfix()

tbl_claim_free_mod$claim_free %>% table()


set.seed(3035)
tbl_train_down <- caret::downSample(
  x=tbl_claim_free_mod %>% select(-claim_free),
  y=tbl_claim_free_mod$claim_free,
  yname ="claim_free"
)
tbl_train_down$claim_free %>% table()

# à faire avec upSample

# caret::createDataPartition()
set.seed(3035)
train_rows <- caret::createDataPartition(
  tbl_severity_mod$Payment,
  p=.7,
  list=FALSE
)

tbl_severity_mod_train <- tbl_severity_mod[train_rows]
tbl_severity_mod_test <- tbl_severity_mod[-train_rows]







