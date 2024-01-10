book<-read.csv("D:/books and stuff/DScience/Book1.csv", header= TRUE, sep=",")

gender<- c('female','male','male','male','male','male','male','male','male')

book<-cbind(book,gender)

str(book)

book$gender<-factor(book$gender,levels = c("female","male"),labels = c(1,2))

summary(book)

# run these lines below in console:
# install.packages("dplyr")
# library(dplyr)
book %>% summarise_if(is.numeric, sd)

# run these lines below in console:
# install.packages("matrixStats")
# library(matrixStats)

score<- c(200,300,400,500,600,700,800,900,1000)

book<-cbind(book,score)

book

book$score = rowSds(as.matrix(book[,c(2,3)]))

book$score
