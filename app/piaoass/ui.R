ui <- fluidPage(
  
  tabsetPanel(
    tabPanel ("Istruzioni", 
              #includeHTML('istruzioni.html')
              ), 
    tabPanel("Valutazione PIAO", 
             br(),
             
             fluidRow(
               column(2, 
                      wellPanel(
                        fileInput('file1', 'Carica il file', accept = c(".xlsx")))
               ), 
               column(4, 
                      tableOutput("dati")), 
               
               column(6,
                      fluidRow(  
                      tableOutput("ris_table")
                      ), 
                      fluidRow(
                        plotOutput("radar")
                      )
                      )
              )
             )
    )
)
 
 
  
  
  
 