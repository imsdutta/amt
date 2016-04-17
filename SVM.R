# SVM

# PROBLEM 1: DATA: Training_Sample data.csv and  Valid_Sample data.csv  
install.packages("e1071")
library(e1071)
data=read.csv("Training_Sample data.csv")
str(data)
View(data)
data$Decision=as.factor(data$Decision)
str(data)
model <- svm(Decision ~ ., data = data, kernel ="radial",cost = 1,cross = 10)
str(model)
write.csv(model$SV,"sv.csv")
pred<-fitted(model)
table(pred, data$Decision)

data1=read.csv("Valid_Sample data.csv")
str(data1)
data1$Decision=as.factor(data1$Decision)
str(data1)
model <- svm(Decision ~ ., data = data1, kernel ="radial",cost = 100,cross = 10)
str(model)
write.csv(model$SV,"sv1.csv")
p=predict(model,data1[,-15])
table(p,data1$Decision)

# PROBLEM 2: DATA: IRIS
data(iris)
attach(iris)
View(iris)
model <- svm(Species ~ ., data = iris,kernel="radial",cost=1,cross=10)
x <- subset(iris, select = -Species)
y <- Species
model <- svm(x, y)
print(model)
summary(model)
pred <- predict(model, x)
table(pred, y)
