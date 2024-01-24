ui <- tagList(
  navbarPage(
    id = "mainTabs",
    title = "DASHBOARD PIAO",
    # theme = shinythemes::shinytheme("simplex"),
    # useShinyjs(),
    singleton(
      tags$head(
        tags$style("@import url(https://use.fontawesome.com/releases/v6.4.2/css/all.css);"),
        # tags$link(rel = "stylesheet", type = "text/css", href = "fontawesome-free-6.4.2-web/css/all.min.css"),
        tags$style(HTML("
        
      #MODAL_INFO #shiny-modal div.modal-dialog {
      /*width: fit-content !important;*/
      width: calc(100% - 50px);
      font-size: 13px;
      }
      
      table.dataTable {
      cursor:default;
      }
      
      .navbar-brand {
      cursor: default;
      }
      
  
  /*SCROLLBAR sotto HEADER */
  
  body {
  height: 100%;
  overflow: hidden;
  }

  body > .container-fluid {
  height: calc(100vh - 100px);
  overflow: auto;
  }
      
  html {
  position: relative;
  min-height: 100%;
  }
  
  body {
  margin-bottom: 30px; /* Margin bottom by footer height */
  }
  
 
  
        .footer {
        color: #fff;
        background-color: #f8f8f8;
        border-top: 1px solid #e7e7e7;
        border-color: #e7e7e7;
        padding-left:15px;
        padding-top: 5px;
        padding-bottom: 5px;
        margin-left: 0px;
        position: relative;
       }
       
        .footer p {
        color: #777;
        vertical-align: middle;
        cursor: default;
        margin-bottom: 0px;
        font-size: 13px;
       }

        .footer a {
        float:right;
        font-size: 14px;
       }
      
      ")))
      
    ),
    
    # tabsetPanel(
    tabPanel("Istruzioni", 
             #includeHTML('istruzioni.html')
    ), 
    
    tabPanel("Valutazione PIAO", 
             fluidPage(style = "padding-left: 0px;padding-right: 0px;",
                       
                       fluidRow(
                         
                         column(5,
                                fileInput('file1', 
                                          label = NULL, 
                                          buttonLabel = 'Carica il file',
                                          placeholder = "Nessun file selezionato",
                                          accept = c(".xlsx")),
                                DT::dataTableOutput("ris_table")
                         ), 
                         column(6, offset = 1,
                                plotOutput("radar", width = "100%", height = "100%")
                         )
                       )
             )
    )
  ),
  tags$footer(uiOutput("footerIZS"), class = "footer"))

