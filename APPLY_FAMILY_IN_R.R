#####APPLY#####

#used to get sum of row/colum in array or matrix
#dataframes will be force converted to matrix

#apply(X,Margin, Fun, ..)

MyMatrix <- matrix(1:9, nrow=3)
MyMatrix

#want to evaluate the sum of each row

apply(MyMatrix, 1, sum)

#for sum of each colum

apply(MyMatrix, 2, sum)

#how apply works with NA's

MyMatrix[2,3] <- NA
MyMatrix

#2nd row wont get evaluated due to NA in it
apply(MyMatrix, 1, sum)

#To handle NA's
apply(MyMatrix, 1, sum, na.rm = TRUE)

#####LAPPLY#####

#Loops over list & evaluates a function on each element
#L stands for list
#result will be a list with same no of elements as object passed to it

#lapply(X, FUN, ...)

MyList <-list(A= matrix(1:9,nrow=3), B=1:5, c=8)
MyList

#want to sum up each element of the list

lapply(MyList, sum)

#result is stored as list incase you dont want to have list output
#can use unlist()

unlist(lapply(MyList, sum))

#can create your own function
#want each element in list to be multiplyed by 10

lapply(MyList, function(x) x*10)

#####SAPPLY#####

#Same as lapply but returns a vector by default
#In cases were vector cant be returned it will return a list or matrix

#sapply(X, FUN, ...)

sapply(MyList, sum)

#In cases were vecor cant be returned it will ruturn a list or matrix

#####MAPPLY#####

#for when there 2 or more lists & want to iterate over them @ same time
#M stands for multivariate

#mapply(Fun, ...)

rep(1,4)

mapply(rep, 1:4,4:1)

#example using user defined functions

x <- c(A=10, B=1, C=40)
y <- c(J=30,K=60, L=50)

#want addition of both elements in the vectors & them multiply by 2
#so create function

simplify <- function(u,v){
  (u+v)*2
}

mapply(simplify, x, y)

#####TAPPLY#####

#creates a subset of a vector & then apply s a function
#(ether in built or customized)
#to each of the subsets

#tapply(${1:vector}, ${2:index}, ${3:function})

head(iris)
unique(iris$Species)

#get max value of Sepal.Length for each Species

tapply(iris$Sepal.Length, iris$Species, max)