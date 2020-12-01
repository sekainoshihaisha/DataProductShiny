library(shiny)

shinyServer(function(input, output) {
    output$wind <- renderPlot({
        airData <- NULL
        
        if (!is.null(input$months)) {
            may <- 5 %in% input$months
            june <- 6 %in% input$months
            july <- 7 %in% input$months
            august <- 8 %in% input$months
            september <- 9 %in% input$months
            
            if (may) {
                airData <- rbind(airData, airquality[airquality$Month == 5,])
            }
            
            if (june) {
                airData <- rbind(airData, airquality[airquality$Month == 6,])
            }
            
            if (july) {
                airData <- rbind(airData, airquality[airquality$Month == 7,])
            }
            
            if (august) {
                airData <- rbind(airData, airquality[airquality$Month == 8,])
            }
            
            if (september) {
                airData <- rbind(airData, airquality[airquality$Month == 9,])
            }
            
            if (input$days != "All") {
                airData <- airData[airData$Day == as.numeric(input$days),]
            }
            
            if (nrow(airData) > 0)
            {
                plot(airData$Wind, airData$Ozone, xlab = "Wind", ylab = "Ozone", main = "Ozone and Wind")
            }
            
            if (nrow(airData) > 1)
            {
                abline(lm(Ozone ~ Wind, data = airData))
            }
        }
        else {
            
        }
    })
    
    output$solarRadiation <- renderPlot({
        airData <- NULL
        
        if (!is.null(input$months)) {
            may <- 5 %in% input$months
            june <- 6 %in% input$months
            july <- 7 %in% input$months
            august <- 8 %in% input$months
            september <- 9 %in% input$months
            
            if (may) {
                airData <- rbind(airData, airquality[airquality$Month == 5,])
            }
            
            if (june) {
                airData <- rbind(airData, airquality[airquality$Month == 6,])
            }
            
            if (july) {
                airData <- rbind(airData, airquality[airquality$Month == 7,])
            }
            
            if (august) {
                airData <- rbind(airData, airquality[airquality$Month == 8,])
            }
            
            if (september) {
                airData <- rbind(airData, airquality[airquality$Month == 9,])
            }
            
            if (input$days != "All") {
                airData <- airData[airData$Day == as.numeric(input$days),]
            }
            
            if (nrow(airData) > 0)
            {
                plot(airData$Solar.R, airData$Ozone, xlab = "Solar Radiation", ylab = "Ozone", main = "Ozone and Solar Radiation")
            }
            
            if (nrow(airData) > 1)
            {
                abline(lm(Ozone ~ Solar.R, data = airData))
            }
        }
        else {
            
        }
    })
    
    output$temperature <- renderPlot({
        airData <- NULL
        
        if (!is.null(input$months)) {
            may <- 5 %in% input$months
            june <- 6 %in% input$months
            july <- 7 %in% input$months
            august <- 8 %in% input$months
            september <- 9 %in% input$months
            
            if (may) {
                airData <- rbind(airData, airquality[airquality$Month == 5,])
            }
            
            if (june) {
                airData <- rbind(airData, airquality[airquality$Month == 6,])
            }
            
            if (july) {
                airData <- rbind(airData, airquality[airquality$Month == 7,])
            }
            
            if (august) {
                airData <- rbind(airData, airquality[airquality$Month == 8,])
            }
            
            if (september) {
                airData <- rbind(airData, airquality[airquality$Month == 9,])
            }
            
            if (input$days != "All") {
                airData <- airData[airData$Day == as.numeric(input$days),]
            }
            
            if (nrow(airData) > 0)
            {
                plot(airData$Temp, airData$Ozone, xlab = "Temperature", ylab = "Ozone", main = "Ozone and Temperature")
            }
            
            if (nrow(airData) > 1)
            {
                abline(lm(Ozone ~ Temp, data = airData))
            }
        }
        else {
            
        }
    })
})
