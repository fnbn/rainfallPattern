# convolve A with B, B being a smaller matrix
# Returns only the inner part
matrixConvolve <- function(A, B) {
  # Pad with zeros
  C <- matrix(rep(0, length(A)), nrow(A), ncol(A))
  C[1:nrow(B), 1:ncol(B)] <- B

  # convolve on torus
  res <- convolve(A, C)
  
  # return relevant part
  return(res[1:(nrow(A) - nrow(B) + 1), 1:(ncol(A) - ncol(B) + 1)])
}
