require(shiny)
runApp(list(
  ui = pageWithSidebar(
    headerPanel("Tab Carousel"),
    sidebarPanel(
      fileInput("userfile", "Choose a file:"),
      uiOutput("column_selection")
    ),
    mainPanel(
      plotOutput("plot") # datatable ?
    )
  ), 

    server= function(input, output){
getFile <- reactive({
  if(!is.null(input$userfile)){
    read.csv(input$userfile$datapath)
  }
})

output$column_selection <- renderUI({
  dat <- getFile()
  if(!is.null(dat)){
    list(
      selectInput("column_x", "Column x:", choices=names(dat)),      
      selectInput("column_y", "Column y:", choices=names(dat)),
      actionButton("gobutton", "Plot!")
    )
  }
})

output$plot <- renderPlot({
  if(!is.null(input$gobutton)){
    dat <- getFile()
    if(input$gobutton==0) return(NULL)
    xname <- input$column_x
    yname <- input$column_y
    plot(dat[,xname], dat[,yname], xlab=xname, ylab=yname)
  }
})
}
  ), la=FALSE)