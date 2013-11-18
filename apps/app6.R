# shiny datatables don't work - rCharts I don't know

getFile2 <- reactive({
  if(!is.null(input$userfile2)){
    read.csv(input$userfile2$datapath)
  }
})

output$column_selection2 <- renderUI({
  dat <- getFile2()
  if(!is.null(dat)){
    list(
      selectInput("column_x2", "Column x:", choices=names(dat)),      
      selectInput("column_y2", "Column y:", choices=names(dat)),
      actionButton("gobutton3", "Plot!")
    )
  }
})

output$plot2 <- renderPlot({
  if(!is.null(input$gobutton3)){
    dat <- getFile2()
    if(input$gobutton3==0) return(NULL)
    xname <- input$column_x2
    yname <- input$column_y2
    plot(dat[,xname], dat[,yname], xlab=xname, ylab=yname)
  }
})

output$jstable <- renderDataTable({
  mtcars #getFile2()
})
