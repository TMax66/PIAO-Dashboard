
server <- function(input, output, session) {

  
  data <- reactive({
    req(input$file1)
    inFile <- input$file1
    df <-  read_excel(inFile$datapath)
    return(df)
  })
  
  
  output$dati<-renderTable(data() %>% 
                             select(1, 3, 4) %>% 
                             head())
  
  

#sintesti risultati
  
  dt<- reactive(data() %>% 
  mutate(Score = ifelse(Score == "si", 1, 0)) %>% 
    group_by(`Area/Dimensione`) %>% 
    summarise(media = round(mean(Score, na.rm = TRUE),2)*100))
  
output$ris_table <- renderTable(dt())



output$radar<- renderPlot({radarchart(  
  rbind(rep(100,9), rbind(rep(0,9), 
                          (dt() %>% 
                             pivot_wider(names_from = `Area/Dimensione`, values_from = media) %>% 
                             data_frame()))))
})




  
}
