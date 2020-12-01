library(shiny)

newSidebarPanel <- function (..., out = NULL, width = 4) 
{
    div(class = paste0("col-sm-", width), 
        tags$form(class = "well", ...),
        out
    )
}

shinyUI(fluidPage(
    titlePanel("Air quality data"),

    sidebarLayout(
        newSidebarPanel(
            fluid = FALSE,
            h3("Ozone factor by other weather elements"),
            checkboxGroupInput("months", "Plot by months:", choiceNames = c("May", "June", "July", "August", "September"), choiceValues = c(5, 6, 7, 8, 9), selected = c(5, 6, 7, 8, 9)),
            selectInput("days", "Plot by days:", choices = c("All", 1:31)),
            out = HTML("<h3>About the project</h3>
                       This project is divided in two parts:
                       <ul>
                            <li>A sidebar panel containing some parameters to show three plots</li>
                            <li>A main panel that presents three plots</li>
                       </ul>
                       The dataset used to make this program is <code>airquality</code> that is located in the <code>dataset package</code> in <code>R</code>.
                       <br/>
                       The principal data that would be plotted will be Ozone that will depend on three other factors:
                       <ul>
                            <li>Wind</li>
                            <li>Solar radiation</li>
                            <li>Temperature</li>
                       </ul>
                       For this instance there will be three different plots. These plots will also show a linear model to get a general view of how the variables may work.
                       <br/>
                       The linear model will be shown only if there are minimum two data points in the plot and the plot will be displayed only if there is at least one data point; otherwise, neither of those elements would be present.
                       <br/>
                       Initially, the three plots will display full data according to the variables, but there are two controls that contains the factor of data filtering for all the plots:
                       <ul>
                            <li>Months: The data contains information of five months (from May to September). In this control, which of the months would be plotted, can be selected.</li>
                            <li>Days: As a subordinate variable, the data contains a register for each day of the months evaluated. In this cantrol can be selected to plot all the days according of to the months selected or a specific day</li>
                        </ul>
                       <strong>As a reminder: </strong> According to the selection of months-days, the plots and/or linear models would be displayed or not.")
        ),
        
        mainPanel(
            plotOutput("wind"),
            plotOutput("solarRadiation"),
            plotOutput("temperature")
        )
    )
))
