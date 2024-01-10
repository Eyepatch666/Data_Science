x<-scan()
print(x)

B<-matrix(1:15,nrow = 3,ncol = 5)
B[,3]
B[2,]
B[1,3]
A<-matrix(1:15,nrow = 3,ncol = 5)
sum<-A+B

V<-c(2,3,4,9,12,15)
div_5<- sum(V %% 5==0)
print(paste("Number of element divisible by 5:",div_5 ))

c<-c(30,50,70,90)
c<-c(c,40)
c<-c[c!=70]
