output$GAUSS <- renderPlot({
  curve(dnorm(x), 
      from=-3, to=3, 
      main=input$title, 
      col=input$color, 
      lwd=input$linewidth, 
      axes=FALSE, xlab=NA, ylab=NA
  )
  axis(1)
})
