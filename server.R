shinyServer(function(input, output) {

  output$main_plot <- renderPlot({

    hist(natty$Spot,
      probability = TRUE,
      breaks = as.numeric(input$n_breaks),
      xlab = "$/mmbtu",
      main = "Natural Gas Spot Price at Henry Hub 2004-2014",
      col="#5882FA")

    if (input$individual_obs) {
      rug(natty$Spot)
    }

    if (input$density) {
      dens <- density(natty$Spot,
          adjust = input$bw_adjust)
      lines(dens, col = "red")
    }

  })
})
