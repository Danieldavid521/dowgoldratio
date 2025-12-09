#load libraries
library(lubridate)
library(rvest)
library(tidyverse)

#read in Dow jones data/file
dia_url <- read_html('https://finance.yahoo.com/quote/DIA/')
gold_url <- read_html('https://finance.yahoo.com/quote/GC=F/')

gold_scraped <- gold_url %>% html_elements(xpath = "//*[@id=\"main-content-wrapper\"]/section[1]/div[2]/div[1]/section/div/section/div[1]/div[1]/span") %>%  html_text2()
dia_scraped <- dia_url %>% html_elements(xpath =   "//*[@id=\"main-content-wrapper\"]/section[1]/div[2]/div[1]/section/div/section/div[1]/div[1]/span") %>%  html_text2()
dia_scraped

gold_url %>% html_elements(xpath="up1.yf-ipw1h0.base")
gold_scraped
element:
<span class="up1 yf-ipw1h0 base" data-testid="qsp-price">4,225.70</span>

x path:
  //*[@id="main-content-wrapper"]/section[1]/div[2]/div[1]/section/div/section/div[1]/div[1]/span
<span class="up1 yf-ipw1h0 base" data-testid="qsp-price">4,225.70</span>
goldprice <- 4197
dowjonesprice <- 47954
date <- 2025-12-07
#read in GOld data/file
data <- data.frame(goldprice, dowjonesprice, date)
#manipulate data into pretty format
data$ratio <- (dowjonesprice/goldprice)
#Save file