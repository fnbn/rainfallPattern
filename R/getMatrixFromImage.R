library(dplyr)

# Turns an image into unscaled rainfall levels (0..181), NA if color cannot be resolved
# @param img the image, loaded with png
getMatrixFromImage <- function(img) {

  # seperate color values
  col <-
    data.frame(r = c(img[,,1]),
               g = c(img[,,2]),
               b = c(img[,,3]),
               a = c(img[,,4]))
  
  # add order numbers to palette
  valueOf <- function(r, g, b, a) {
    inner_valueOf <- function(r_, g_, b_, a_) {
      if (a_ == 0) {
        return(0)
      } else if (r_ > 0 & g_ > 0 & b_ == 255 ) {
        return(64 - floor(64*r_/256))
      } else if (r_ == 0 & b_ == 255) {
        return(68 - floor(4*(g_ - 148)/6))
      } else if (r_ == 0 & b_ < 255 & g_ > 60) {
        return(100 - floor(0.4 + 31*(g_ - 97 + b_ - 217)/86))
      } else if (r_ == 0 & g_ == 60 & b_ == 200) {
        return(101)
      } else if (r_ == 0 & g_ == 0 & b_ == 101) {
        return(102)
      } else if (r_ > 0 & g_ == 0 & b_ < 255) {
        return(180 - floor(0.26 + 77*(r_ - 93)/150))
      } else if (r_== 255 & g_ == 0 & b_ == 255) {
        return(181)
      } else {
        return(NA)
      }
    }
   as.integer(mapply(inner_valueOf, r_=r*255, g_=g*255, b_=b*255, a_=a*255))
  }
  
  col <- 
    col %>%
    mutate(value = valueOf(r, g, b, a))
  
  matrix(col$value, nrow = nrow(img), ncol = nrow(img))
}
