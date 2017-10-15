# Set outside to NA because these values have different resolution with respect to time and
# space
# @param mat A matrix gained from getMatrixFromImage
# @return A matrix with the same dimensions where everything outside the inner circle is set
# to NA
filterForHamburg <- function(mat) {
  rows <- nrow(mat)
  len <- length(mat)
  idx <-
    seq(0, len-1) %>%
    (function(a) {
       x <- a %% rows
       y <- (a - x) / rows
       ifelse((y - 436)^2 + (x - 403)^2 > 135^2, TRUE, FALSE)
     })
  print(sum(idx))
  print(sum(!idx))
  mat[idx] <- NA
  return(mat)
}
