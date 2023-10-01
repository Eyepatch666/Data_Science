i<-0
while(i<6){
  i<-i+1
  if(i==3){
    next
  }
  print(i)
}
for(x in 1:10){
  print(x)
}
for(x in 1:2){
  for(y in 1:3){
    print(x*y)
  }
}
sum<- function(){
  print("hello")
}
sum()

var1 = readline(prompt = "enter any value: ")
var2 = readline(prompt = "enter any value: ")

var2 = as.integer(var2)
print(var1)
print(var2)

x = scan()
print (x)

g<-c(TRUE,FALSE,TRUE,TRUE)
while(g==TRUE){
  print(x)
}
length(g)
h<-c(2,3,4)
h+c(3,4,5)
sort(h, decreasing = TRUE)
h[1]
mymatrix<-matrix(1:20, nrow=5,ncol=4)
cells<-c(1:4)
rnames<-c("r1","r2")
cnames<-c("c1","c2")
matrix2<-matrix(cells,nrow=2,ncol=2,byrow=TRUE,dimnames = list(rnames,cnames))
matrix2[2,]
matrix2[,2]
cells2<-c(1:10)
rnames2<-c("r1","r2")
cnames2<-c("c1","c2","c3","c4,","c5")
matrix2<-matrix(cells2,nrow=2,ncol=5,byrow=FALSE,dimnames = list(rnames2,cnames2))
