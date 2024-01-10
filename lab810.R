patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetese<-c("type1","type2","type1","type1")
status<-c("poor","improved","excellent","poor")
patientdata<-data.frame(patientID,age,diabetese,status)
patientdata
patientdata1<-edit(patientdata)
patientdata1
mean(patientdata[,2])
bloodgroup= c("A","B","O","AB")
patientdata['bloodgroup']<-bloodgroup
patientdata
patientdata[nrow(patientdata)+1,]<-c(5,45,"type1","poor","AB","AB","AB","AB","O")
patientdata
patientdata <- subset(patientdata, select = -A)
patientdata <- subset(patientdata, select = -B)
patientdata <- subset(patientdata, select = -O)
patientdata <- subset(patientdata, select = -AB)
patientdata
install.packages("tibble")
library("tibble")
patientdata %>% add_column(serial = 11:15, .before = "patientID")
mean(patientdata$age)
patientdata
output<- summary(patientdata)
print(output)
a<-"This is list suka"
b<-c(69,666,777,6251)
Mtrx<-matrix(1:10,nrows=5)
go<-c("one","two","three")
s =scan("D:/books and stuff/DScience/JAMAL.txt", what = "")
print(s)
patientdata<-edit(patientdata)
patientdata
