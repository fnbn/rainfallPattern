source('R/solveConvolution.R')
source('R/matrixConvolve.R')

n <- 100
m <- 200
o <- 10
p <- 10

A <- matrix(runif(n*m), n, m)
X <- matrix(runif(o*p), o, p)
B <- matrixConvolve(A, X)

X_approx <- solveConvolution(A, B)

print(X-X_approx)
