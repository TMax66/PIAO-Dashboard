ui <- tagList(
  navbarPage(
    id = "mainTabs",
    title = "ASSESSMENT PIAO",
    # theme = shinythemes::shinytheme("simplex"),
    # useShinyjs(),
    singleton(
      tags$head(
        tags$style("@import url(https://use.fontawesome.com/releases/v6.4.2/css/all.css);"),
        # tags$link(rel = "stylesheet", type = "text/css", href = "fontawesome-free-6.4.2-web/css/all.min.css"),
        tags$style(HTML("
        
        #mainTabs > li:first-child { display: none; }
        #mainTabs > li:nth-child(2) { display: none; }
        
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
      
      .navbar-default {
      background-color:#00a3a8;
      height: 60px;
      }

.navbar-static-top {background-color: #00a3a8;}
.navbar-default .navbar-nav>.active>a {background-color: #00a3a8;}   
.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:hover, .navbar-default .navbar-nav>.active>a:focus {
    color: #fff;
    background-color: transparent;
}

.navbar-default .navbar-brand:hover {
color: #fff;
cursor: default;
}

.navbar-nav {
height:60px;
padding-top: 5px;
padding-bottom: 5px;
}
      
.navbar-default .navbar-nav>li>a {
color: #d1d1d1;
font-size: 15px;
}

.navbar-default .navbar-nav>li>a:hover {
color: #fff;
-webkit-transition: all 400ms ease;
        transition: all 400ms ease;
}

.navbar-default .navbar-brand {
color: #fff;
font-size: 28px;
height:60px;
padding-top: 20px;
padding-bottom: 20px;
}

.navbar-default .navbar-brand:hover {
color: #fff;
cursor: default;
}

      
  
  /*SCROLLBAR sotto HEADER */
  
  body {
  height: 100%;
  overflow: hidden;
  }

  body > .container-fluid {
  height: calc(100vh - 110px);
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
        background-color: #00a3a8;
        border-top: 1px solid #e7e7e7;
        border-color: #e7e7e7;
        padding-left:15px;
        padding-top: 5px;
        padding-bottom: 5px;
        margin-left: 0px;
        position: relative;
       }
       
        .footer p {
        color: #fff;
        vertical-align: middle;
        cursor: default;
        margin-bottom: 0px;
        font-size: 13px;
       }

        .footer a {
        color:#fff;
        float:right;
        font-size: 14px;
        }
       
       .footer a:hover {
        color: #00dcf1;
        -webkit-transition: all 400ms ease;
        transition: all 400ms ease;
        }
      
      ")))
      
    ),
    tags$script(HTML("var header = $('.navbar > .container-fluid');
header.append('<span style=\"float:right;\"><a href=\"https://valorepubblico.com/\"  target=\"_blank\"><img src=\"logo_cervap.png\" alt=\"alt\" style=\"float:right;height:50px;\"> </a></span>');
    console.log(header)")
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

