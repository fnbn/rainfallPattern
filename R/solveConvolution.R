# Find the right matrix from a convolution, i.e. if A*X = B, find X
# A*X is the convolution that is done by matrixConvolve(A, X)
solveConvolution <- function(A, B) {
  n <- nrow(A)
  m <- ncol(A)
  k <- nrow(B)
  l <- ncol(B)

  # Matrices of linear system. Don't ask..
  A_transformed <-
    matrix(A[sapply(
               sapply(
                 n*seq(0, m-l),
                 function(x) seq(0, n-k) + x
               ),
               function(y)
                 sapply(
                   n*seq(0, l-1),
                   function(x) seq(1, k) + x
                 ) + y
             )
           ], k*l, (n-k+1)*(m-l+1))

  B_transformed <- matrix(B, k*l, 1)
    
  return(matrix(qr.solve(A_transformed, B_transformed), n-k+1, m-l+1))
}
