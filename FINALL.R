library(readxl)
library(e1071)
library("caret")

titanic <- read.csv("D:/booksandstuff/DScience/final/project/titanic.csv", header = TRUE, sep = ",")
head(titanic)

titanic$Age[is.na(titanic$Age)] <- mean(titanic$Age, na.rm = TRUE)

head(titanic)
null_age_values <- is.na(titanic$Age)

titanic$Age <- cut(
  titanic$Age,
  breaks = c(0, 13, 20, 51, Inf),
  labels = c("kid", "teen", "adult", "old"),
  right = FALSE
)
head(titanic)

titanic$Survived <- cut(
  titanic$Survived,
  breaks = c(0, 1, Inf),
  labels = c("survived", "died"),
  right = FALSE
)
head(titanic)

titanic$Pclass <- cut(
  titanic$Pclass,
  breaks = c(1, 2, 3, Inf),
  labels = c("firstclass", "secondclass", "thirdclass"),
  right = FALSE
)
head(titanic)

titanic$Fare <- cut(
  titanic$Fare,
  breaks = c(0, 21, 41, Inf),
  labels = c("cheap", "midrange", "expensive"),
  right = FALSE
)
head(titanic)

table(titanic$Survived, titanic$Age)
chisq.test(titanic$Survived, titanic$Age, correct=FALSE)

table(titanic$Survived, titanic$Fare)
chisq.test(titanic$Survived, titanic$Fare, correct=FALSE)

table(titanic$Survived, titanic$SibSp)
chisq.test(titanic$Survived, titanic$SibSp, correct=FALSE)

table(titanic$Survived, titanic$Parch)
chisq.test(titanic$Survived, titanic$Parch, correct=FALSE)

table(titanic$Survived, titanic$Embarked)
chisq.test(titanic$Survived, titanic$Embarked, correct=FALSE)

titanic<- subset(titanic,select = -SibSp)
titanic<- subset(titanic,select = -Parch)
titanic<- subset(titanic,select = -Embarked)
titanic<- subset(titanic,select = -Fare)
titanic<- subset(titanic,select = -Name)
titanic<- subset(titanic,select = -Ticket)
titanic<- subset(titanic,select = -Cabin)
titanic<- subset(titanic,select = -PassengerId)

train = titanic[1:1047,]
test = titanic[1048:1309,]

ctrl <- trainControl(method = "cv", number = 10)

model <- train(Survived ~ ., data = train,vmethod = "nb", trControl = ctrl)

summary(model)

predictions <- predict(model, test)
cm <- confusionMatrix(predictions, test$Survived)
print(cm)

TP <- cm$table[2, 2]
TN <- cm$table[1, 1]
FP <- cm$table[1, 2]
FN <- cm$table[2, 1]

Recall <- TP / (TP + FN)
Precision <- TP / (TP + FP)
F_measure <- 2 * (Precision * Recall) / (Precision + Recall)

cat("Recall:", Recall, "\n")
cat("Precision:", Precision, "\n")
cat("F-measure:", F_measure, "\n")
