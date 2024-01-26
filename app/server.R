
server <- function(input, output, session) {
  
  
  data <- reactive({
    req(input$file1)
    inFile <- input$file1
    df <-  read_excel(inFile$datapath)
    return(df)
  })
  
  dt <- reactive({
    data() %>% 
      mutate(Score = ifelse(Score == "si", 1, 0)) %>% 
      group_by(`Area/Dimensione`) %>% 
      summarise(media = round(mean(Score, na.rm = TRUE),2)*100) 
  })
  
  
  ris_dt <- reactive({
    dt() %>% mutate(info = shinyInput(actionButton,
                                      nrow(dt()),
                                      'button_',
                                      class = "btn btn-light btn-sm",
                                      style = "color: #337ab7; background-color: transparent !important; border-color: transparent !important; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;", #color: #fff; background-color: #375a7f; border-color: #2e6da4
                                      label = tags$div(HTML("<i class=\"fa-solid fa-info-circle fa-2x\"></i>")),
                                      onclick = paste0('Shiny.setInputValue(\"select_button_info\",  this.id.concat(\"_\", Math.random()))')
    ), .before = `Area/Dimensione`)
  })
  
  
  observeEvent(input$select_button_info, {
    selectedRow <- as.numeric(strsplit(input$select_button_info, "_")[[1]][2])
    
    showModal(
      tags$div(id="MODAL_INFO",
               modalDialog(
                         HTML(paste0(
                           h4(style="text-align:justify;font-weight:bold;",
                              toupper("Area/Dimensione: "),
                              dt()$`Area/Dimensione`[selectedRow])
                           )),
                         size = "m",
                         footer = NULL,
                         easyClose = TRUE,
                         DT::dataTableOutput(
                           paste0("filtered", selectedRow)
                         )
                       )
    )
    )
    
    output[[paste0("filtered", selectedRow)]] <- DT::renderDataTable(server = FALSE, {
      
      data() %>%
        filter(`Area/Dimensione` %in% dt()$`Area/Dimensione`[selectedRow]) %>%
        select(-`Area/Dimensione`) %>% 
        DT::datatable(
          
          class = 'cell-border compact',
          rownames = FALSE,
          escape = FALSE,
          selection = "none",
          options = list(dom = "t"))
    })
  })
  
  
  # output$dati<-renderTable(
  #   data() %>% 
  #     select(1, 3, 4) %>% 
  #     head()
  #   )
  

  output$ris_table <- DT::renderDataTable({
    dtable <- DT::datatable(ris_dt(),
                            colnames = c(" ", "Area/Dimensione", "media"),
                            rownames = FALSE,
                            escape = FALSE,
                            selection = "none",
                            options = list(dom = "t"))
    dtable
  })
  
  
  output$radar <- renderPlot({
    
    radarchart(
      rbind(rep(100,nrow(dt())), rep(0,nrow(dt())), 
            dt() %>% 
              mutate(`Area/Dimensione` = str_wrap(`Area/Dimensione`, width = 20)) %>% 
              pivot_wider(names_from = `Area/Dimensione`, values_from = media) %>% 
              tibble()))
    
    
    
  }, height = 600, width = 600 )
  
  output$footerIZS <- renderUI({
    
    tags$div(
      HTML(
        # paste0("ultimo aggiornamento: ",
        #           format(as.Date(data_aggiornamento), "%e/%m/%Y"))
        
        paste0("<p>",
               "<i>Creato da Massimo Tranquillo e Andrea Boscarino, Controllo di Gestione e Performance, IZSLER</i>",
               # "<a href='https://twitter.com/izsler' target='_blank'>",
               # "<i class='fa-brands fa-x-twitter' style='padding-right: 10px;' aria-hidden='true'></i>",
               # "</a>",
               # "<a href='https://it.linkedin.com/company/izsler' target='_blank'>",
               # "<i class='fa-brands fa-linkedin-in' style='padding-right: 10px;' aria-hidden='true'></i>",
               # "</a>",
               # "<a href='https://www.facebook.com/people/Istituto-Zooprofilattico-Sperimentale-Della-Lombardia-Ed-Emilia-Romagna/100087222248133/' target='_blank'>",
               # "<i class='fa-brands fa-facebook-f' style='padding-right: 10px;' aria-hidden='true'></i>",
               # "</a>",
               "</p>")
        
        )
    )
  })
  
  
  
}
