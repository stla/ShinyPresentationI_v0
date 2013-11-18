output$GAUSS3 <- renderPlot({
  if(input$gobutton !=0){ # create connection to input$gobutton
  curve(dnorm(x), 
      from=-3, to=3, 
      main=isolate(input$title3), 
      col=isolate(input$color3), 
      lwd=isolate(input$linewidth3), 
      axes=FALSE, xlab=NA, ylab=NA
  )
  axis(1)
  }
}, height=250)
