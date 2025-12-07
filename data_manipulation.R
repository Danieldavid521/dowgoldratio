#load libraries
library(lubridate)

#read in Dow jones data/file
goldprice <- 4197
dowjonesprice <- 47954
date <- 2025-12-07
#read in GOld data/file
data <- data.frame(goldprice, dowjonesprice, date)
#manipulate data into pretty format
data$ratio <- (dowjonesprice/goldprice)
#Save file