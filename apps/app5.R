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
      actionButton("gobutton2", "Plot!")
    )
  }
})

output$plot <- renderPlot({
  if(!is.null(input$gobutton2)){
    dat <- getFile()
    if(input$gobutton2==0) return(NULL)
    xname <- input$column_x
    yname <- input$column_y
    plot(dat[,xname], dat[,yname], xlab=xname, ylab=yname)
  }
})

#output$gob <- renderPrint({input$gobutton2})