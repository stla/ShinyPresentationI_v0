output$GAUSS2 <- renderPlot({
  curve(dnorm(x), 
      from=-3, to=3, 
      main=input$title2, 
      col=isolate(input$color2), 
      lwd=input$linewidth2, 
      axes=FALSE, xlab=NA, ylab=NA
  )
  axis(1)
}, height=250)
