install.packages('rsconnect')
rsconnect::setAccountInfo(name='nanwang',
                          token='C628DE1B5ED549EA04BFD74722034A4B',
                          secret='<SECRET>')
library(rsconnect)
rsconnect::deployApp('path/to/your/app')