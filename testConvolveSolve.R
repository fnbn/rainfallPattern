source('R/solveConvolution.R')
source('R/matrixConvolve.R')

n <- 1000
m <- 700
o <- 25
p <- 25

A <- matrix(runif(n*m), n, m)
X <- matrix(runif(o*p), o, p)
B <- matrixConvolve(A, X)

X_approx <- solveConvolution(A, B)

print(norm(X-X_approx, "2"))
