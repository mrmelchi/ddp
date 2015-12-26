library(shiny)
library(bitops)
library(RCurl)

x <- getURL("https://d396qusza40orc.cloudfront.net/appliedregression/Homeworks/week2-HW-data.csv")
data <- read.csv(text = x)

# fitting linear model
model <- lm(SBP ~ AGE + SMK + QUET,  data= data)
Weight <- 86
Height <- 1.73
QUET <- Weight/Height^2/703.1*100

SBPpredict <- function(AGE,SMK,QUET){
    predict(model,newdata=data.frame(AGE=AGE,SMK=SMK,QUET=QUET),interval = "conf")  
} 

shinyServer(
         
    function(input, output) {
        output$inputValue1 <- renderPrint({input$AGE})
        output$inputValue2 <- renderPrint({input$SMK})
        output$prediction <- renderPrint({SBPpredict(input$AGE,input$SMK,
                            input$Weight/input$Height^2/703.1*100)[,1]})
        output$lwr <- renderPrint({SBPpredict(input$AGE,input$SMK,
                            input$Weight/input$Height^2/703.1*100)[,2]})
        output$upr <- renderPrint({SBPpredict(input$AGE,input$SMK,
                            input$Weight/input$Height^2/703.1*100)[,3]})
                })