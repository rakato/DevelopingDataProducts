shinyUI(bootstrapPage(

  selectInput(inputId = "n_breaks",
      label = "Number of bins in histogram:",
      choices = c(10, 25, 50, 100),
      selected = 20),

  checkboxInput(inputId = "individual_obs",
      label = strong("Show individual spot price instances"),
      value = FALSE),

  checkboxInput(inputId = "density",
      label = strong("Show spot price density curve"),
      value = FALSE),

  plotOutput(outputId = "main_plot", height = "500px"),

  #Display this only if the density is shown
  conditionalPanel(condition = "input.density == true",
    sliderInput(inputId = "bw_adjust",
        label = "Bandwidth adjustment:",
        min = 0.2, max = 2, value = 1, step = 0.2)
  )

))
