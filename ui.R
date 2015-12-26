shinyUI(pageWithSidebar(
  headerPanel("Compute Value at Risk"),
  sidebarPanel(
    p("Documentation: Value-at-risk is a measure of financial risk.  It measures the loss your investment will experience at a given level of probability.  For example, if an investment has a one-year 5% VaR of $1,000, there is a 0.05 probability that the investment will decline more than $1,000 over one year."),
    p("This app allows you to enter basic characteristics of your invesment (initial amount, holding period, average return, standard deviation) and the runs a simulation to estimate the value at risk given those parameters."),
    p("Please enter your investment assumptions below and look at the chart to see the ending value of your investment and it's VaR (value-at-risk)"),
    h4("How much do you want to invest?"),
    numericInput('initial.wealth', 'Enter a whole number greater than 1:', 1000, min = 1, step = 100),
    h4("How long will you hold this investment?"),
    numericInput('periods', 'Enter a whole number greater than 1:', 1, min = 1, step = 1),
    h4("What is your expected annual average (mean) return?"),
    numericInput('mean.return', 'Enter decimal number greater than -1.00 (for reference average returns are around 0.08 and 0.11:', 0.10, min = -1, max=1.00, step = 0.01),
    h4("What is your expected annualized standard deviation of returns?"),
    numericInput('std.dev', 'Enter a decimal number greater than 0.00 (for reference average standard deviations are around 0.20:', 0.20, min = 0, max=1.00,step = 0.01),
    h4("What is your value-at-risk cutoff?  This is the probability level for which you want to determine your Value-at-Risk"),
    numericInput('quantile', 'Enter a decimal number between 0.00 to 1.00 (for reference, 0.05 is a commonly used value:', 0.05, min = 0, max=1.00, step = 0.01)
    ),
  mainPanel(
    plotOutput('newHist')
  )
))