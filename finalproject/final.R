library(readxl)
library(dplyr)
library("caret")
library(e1071)

train <- read.csv("D:/booksandstuff/DScience/final/project/train.csv", header = TRUE, sep = ",")
head(train)

train$Age[is.na(train$Age)] <- mean(train$Age, na.rm = TRUE)

head(train)
null_age_values <- is.na(train$Age)


train$Age <- cut(
  train$Age,
  breaks = c(0, 13, 20, 51, Inf),
  labels = c("kid", "teen", "adult", "old"),
  right = FALSE
)
head(train)

train$Survived <- cut(
  train$Survived,
  breaks = c(0, 1, Inf),
  labels = c("survived", "died"),
  right = FALSE
)
head(train)

train$Pclass <- cut(
  train$Pclass,
  breaks = c(1, 2, 3, Inf),
  labels = c("firstclass", "secondclass", "thirdclass"),
  right = FALSE
)
head(train)

train$Fare <- cut(
  train$Fare,
  breaks = c(0, 21, 41, Inf),
  labels = c("cheap", "midrange", "expensive"),
  right = FALSE
)
head(train)


table(train$Survived, train$Age)
chisq.test(train$Survived, train$Age, correct=FALSE)

table(train$Survived, train$Fare)
chisq.test(train$Survived, train$Fare, correct=FALSE)

table(train$Survived, train$SibSp)
chisq.test(train$Survived, train$SibSp, correct=FALSE)

table(train$Survived, train$Parch)
chisq.test(train$Survived, train$Parch, correct=FALSE)

table(train$Survived, train$Embarked)
chisq.test(train$Survived, train$Embarked, correct=FALSE)

table(train$Survived, train$Sex)
chisq.test(train$Survived, train$Sex, correct=FALSE)


train<- subset(train,select = -SibSp)
train<- subset(train,select = -Parch)
train<- subset(train,select = -Embarked)
train<- subset(train,select = -Fare)
train<- subset(train,select = -Name)
train<- subset(train,select = -Ticket)
train<- subset(train,select = -Cabin)


test <- read.csv("D:/booksandstuff/DScience/final/project/test.csv", header = TRUE, sep = ",")

test$Age[is.na(test$Age)] <- mean(test$Age, na.rm = TRUE)

head(test)
null_age_values <- is.na(test$Age)


test$Age <- cut(
  test$Age,
  breaks = c(0, 13, 20, 51, Inf),
  labels = c("kid", "teen", "adult", "old"),
  right = FALSE
)
head(test)

test$Survived <- cut(
  test$Survived,
  breaks = c(0, 1, Inf),
  labels = c("survived", "died"),
  right = FALSE
)
head(test)

test$Pclass <- cut(
  test$Pclass,
  breaks = c(1, 2, 3, Inf),
  labels = c("firstclass", "secondclass", "thirdclass"),
  right = FALSE
)
head(test)

test$Fare <- cut(
  test$Fare,
  breaks = c(0, 21, 41, Inf),
  labels = c("cheap", "midrange", "expensive"),
  right = FALSE
)
head(test)



table(test$Survived, test$Age)
chisq.test(test$Survived, test$Age, correct=FALSE)

table(test$Survived, test$Fare)
chisq.test(test$Survived, test$Fare, correct=FALSE)

table(test$Survived, test$SibSp)
chisq.test(test$Survived, test$SibSp, correct=FALSE)

table(test$Survived, test$Parch)
chisq.test(test$Survived, test$Parch, correct=FALSE)

table(test$Survived, test$Embarked)
chisq.test(test$Survived, test$Embarked, correct=FALSE)

table(test$Survived, test$Sex)
chisq.test(test$Survived, test$Sex, correct=FALSE)




test<- subset(test,select = -SibSp)
test<- subset(test,select = -Parch)
test<- subset(test,select = -Embarked)
test<- subset(test,select = -Fare)
test<- subset(test,select = -Name)
test<- subset(test,select = -Ticket)
test<- subset(test,select = -Cabin)



ctrl <- trainControl(method = "cv", number = 10)


model <- train(Survived ~ ., data = train,vmethod = "nb", trControl = ctrl)


summary(model)

predictions <- predict(model, test)
cm <- confusionMatrix(predictions, test$Survived)
print(cm)
