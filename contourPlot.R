#library(png)
#library(plotly)
library(magrittr)

source("R/getMatrixFromImage.R")

# Contour plot a resolved image
getCurrentMatrix <- function() {
  'https://mi-pub.cen.uni-hamburg.de/fileadmin/files/ninjo/Batch/pattern_c_hhg.png' %>%
    (httr::GET) %>%
    `$`('content') %>%
    (png::readPNG) %>%
    getMatrixFromImage
}

mat1 <- getCurrentMatrix()
Sys.sleep(60)
mat2 <- getCurrentMatrix()

filled.contour(mat1)
filled.contour(mat2)
