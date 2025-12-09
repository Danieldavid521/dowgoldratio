#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(lubridate)
library(rvest)
library(tidyverse)

library(shiny)

ui <- fluidPage(
  textOutput(outputId = "outResult")
)

server <- function(input, output) {

  
  output$outResult <- renderText({
    
    invalidateLater(86400000)
    
    dia_url <- read_html('https://finance.yahoo.com/quote/DIA/')
    gold_url <- read_html('https://finance.yahoo.com/quote/GC=F/')
    
    gold_scraped <- gold_url %>% html_elements(xpath = "//*[@id=\"main-content-wrapper\"]/section[1]/div[2]/div[1]/section/div/section/div[1]/div[1]/span") %>%  html_text2()
    dia_scraped <- dia_url %>% html_elements(xpath =   "//*[@id=\"main-content-wrapper\"]/section[1]/div[2]/div[1]/section/div/section/div[1]/div[1]/span") %>%  html_text2()
    dia_scraped
  })
}

shinyApp(ui = ui, server = server)   