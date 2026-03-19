### Cours 8 ---- 

### Classification Linéaire 

data("iris")

#### Analyse exploratoire ---- 

dim(iris)

str(iris)

#Variable Y 

table(iris$Species)


# Nombre de valeur manquantes 

sum(is.na(iris))


#Graphique X selon Y

ggplot(iris, mapping = aes(x=Petal.Length, y=Petal.Width, colour = Species))+
  geom_point()

ggplot(iris, mapping = aes(x=Sepal.Length, y=Sepal.Width, colour = Species))+
  geom_point()


#### Modélisation ----



model_virginica <- glm(Species=="virginica"~Petal.Length+Petal.Width, data = iris, family = "binomial")
summary(model_virginica)


#### Prediction ---- 

iris$prediction = predict(model_virginica, data = iris)
View(iris)

iris$prediction_response = predict(model_virginica, data = iris, type = "response")


summary(iris$prediction_response)


iris$prediction_classe <- ifelse(iris$prediction_response>0.5, 1, 0)
iris$observation_classe <- ifelse(iris$Species == "virginica", 1, 0)


matrice_confusion <- table(Prediction = iris$prediction_classe, Observation = iris$observation_classe )
matrice_confusion


TP <- matrice_confusion[2,2]
TN <- matrice_confusion[1,1]
FP <- matrice_confusion[2,1]
FN <- matrice_confusion[1,2]



#Accuracy 

(matrice_confusion[1,1]+matrice_confusion[2,2])/sum(matrice_confusion)


#Precision 

matrice_confusion[2,2]/sum(matrice_confusion[2,])


#Recall 

matrice_confusion[2,2]/sum(matrice_confusion[,2])


#specificity 

matrice_confusion[1,1]/sum(matrice_confusion[,1])


library(caret)

confusionMatrix(factor(iris$prediction_classe), factor(iris$observation_classe))


