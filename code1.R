#####################################
########### Tutorial 1
#####################################


#-----------------------------
#--------- Structures
#-----------------------------

a <- 10 # or a = 10 # Scalar

u <- c(1,2,3) # Numeric vector [1 2 3]
u <- c(T,T,F) # Logical vector [TRUE TRUE FALSE]

A <- matrix(1:10, nrow = 5, ncol = 2) # Matrix (numeric only)

l <- list(u=2, v="abc") # List (can contain different types)
class(l)

df <- data.frame(
  ID = 1:10,
  Group = sample(0:1, 10, replace=TRUE),
  Var1 = rnorm(10),
  Var2 = seq(0, 1, length.out=10),
  Var3 = rep(c('a', 'b'), each=5)
) # Data Frame
class(df)

#-------------------------------
#---------- Create Vectors
#-------------------------------
c(1,2,3,4,5)
c("a","b","c")
c(1,"a")

x <- c(1,2,3,5,6,7)
class(x)

y <- c("a","b","d")
class(y)

z <- c(x,y)
z[1]
z[8]
ls()

x <- 3:10.5
x=rep(2,10) ## (2 2 2 2 2 2 2 2 2 2)
x=seq(1,10) ## (1 2 3 4 5 6 7 8 9 10)
x=c(42,"Statistics") ## ("42","Statistics")
x=rep("A",times=5) ## ("A" "A" "A" "A" "A")
x=seq(from=1.5, to=4.2, by=0.3) ## (1.5 1.8 2.1 2.4 2.7 3.0 3.3 3.6 3.9 4.2)


length(x) ## the length of vector x
x[2]
x <- x[-c(2,3)]   ## remove second and third elements
x

#-------------------------------
#-----------  Matrix
#-------------------------------

matrix(0, nrow = 3, ncol = 3)
matrix(1, nrow = 3, ncol = 3)
diag(3)

x <- 1:9
y <- 9:1
X <- matrix(x,nrow = 3, ncol = 3)
Y <- matrix(y,nrow = 3, ncol = 3)

X+Y ## entry-wise addition of matrices
X-Y ## entry-wise subtraction
X*Y ## entry-wise multiplication of matrices
X/Y ## entry-wise division of matrices
X %*% Y ## the usual matrix multiplication
t(X) ## the transpose of a matrix
Z <- matrix(c(9, 2, -3, 2, 4, -2, -3, -2, 16), nrow = 3, byrow = TRUE)
Z[1,2] ## the (1,2) entry of Z
Z[1,] ## the row 1 of Z
Z[,2] ## the column 2 of Z
solve(Z) ## the inverse of Z
diag(Z) ## take out the diagonal entries of a matrix
dim(Z) ## the dimension of a matrix

Z <- Z[-1,]
rowSums(Z)
colSums(Z)
rowMeans(Z)
colMeans(Z)


#---------------------------------
#------- Real Data Example
#---------------------------------


data()
class(women)
?women

plot(weight~height, data = women, xlab = "height", ylab = "weight", pch = 20, cex = 2, col = "darkblue")

dim(women)
n <- nrow(women)

wh_model <- lm(weight~height, data = women)
wh_model_sum <- summary(wh_model)
wh_model_sum
wh_model_sum$coefficients

abline(wh_model, col = "red", lwd = 3)

predict(wh_model, newdata = data.frame(height = c(68, 69)))

confint(wh_model,level = 0.999)

# confidence intervals for mean response
predict(wh_model, newdata = data.frame(height = c(68, 69)), interval = "confidence", level = 0.95)
# confidence intervals for new observation
predict(wh_model, newdata = data.frame(height = c(68, 69)), interval = "prediction", level = 0.95)

