library(shiny)
library(bslib)
library(here)
library(tidyverse)
library(readxl)
library(fmsb)

# 
# # dati
# 
# 
# x <-read_excel(here("dati",  "griglia.xlsx"),col_types = c("text", "text", "text", "text"))
# # 
# # 
# x %>%
#   mutate(Score = ifelse(Score == "si", 1, 0)) %>%
#   group_by(`Area/Dimensione`) %>%
#   summarise(media = round(mean(Score, na.rm = TRUE),2)*100) -> xx
# 
# xx %>% 
#   pivot_wider(names_from = `Area/Dimensione`, values_from = media) %>% 
#   data_frame()-> z
# 
# 
# 
# zz<- rbind( rep(100,9), rbind(rep(0,9), z))
#    
# 
# radarchart(zz)
# 
# 
# radarchart(  
# rbind(rep(100,9), rbind(rep(0,9), 
#                         (xx %>% 
#                            pivot_wider(names_from = `Area/Dimensione`, values_from = media) %>% 
#                            data_frame()))))
#  
# 
# 
# 
# #grafico
# 
# radar

shinyInput <- function(FUN, len, id, ...) {
  inputs <- character(len)
  for (i in seq_len(len)) {
    inputs[i] <- as.character(FUN(paste0(id, i), ...))
  }
  inputs
}


