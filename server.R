library(UsingR)
data(galton)
shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      initial.wealth=input$initial.wealth
      periods=input$periods
      mu.return = input$mean.return
      sigma.return = input$std.dev
      percentile = input$quantile
      d.returns=c()
      d.wealth = c()
      #d = prod(rnorm(periods,mu.return+1,sigma.return)-1) 
      samplesize = 1000
      for (i in  1:samplesize){
        # comment out the d.returns line
        d.returns = append(d.returns,prod(rnorm(periods,mu.return+1,sigma.return))^(1/periods)-1)
        d.wealth=append(d.wealth,prod(initial.wealth,rnorm(periods,mu.return+1,sigma.return)))
      }
      q=quantile(d.wealth,percentile)
      hist(d.wealth,cex=1.5,xlab='Simulated Distribution of Final Investment Value',col="snow2",main=paste("The expected final value of your investment is", round(mean(d.wealth,0)), "\n and you have a",round(percentile,2)*100,"% chance of losing more than",round(initial.wealth-q,2),"(VaR)"),prob=TRUE)
      lines(c(q, q), c(0, 200),col="red",lwd=3)
      lines(density(d.wealth))
      ##mtext(paste("VAR: ",round(q,2)),side=1,padj=1,line=-7,adj=0,cex=1.5)
    })  

  }
)