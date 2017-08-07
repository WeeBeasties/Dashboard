library(shinydashboard)
library(tidyverse)
library(rsconnect)

myData <- read_csv("sampleData")

ui <- dashboardPage(
	skin = "red",
	dashboardHeader(title = "General Education",
			dropdownMenu(type = "messages",
				   messageItem(
				   	from = "Dr. Franklund",
				     	message = "These data are fictitious.",
				     	icon = icon("exclamation-triangle")
				     )
			)),
	dashboardSidebar(
		titlePanel("  Performance by"),
		selectInput("semester", "Semester:",
			    c("All" = 5,
			      "Fall 2016" = 1,
			      "Spring 2017" = 2,
			      "Fall 2017" = 3,
			      "Spring 2018" = 4))
	),
	dashboardBody(
		# Setting the CSS of the dashboard to look prettier
		tags$style(HTML("
		body > div.wrapper > div > section > h2 {
			display: block;
			position: relative;
			top: -11px;
			font-size: 35px;
			font-weight: 150;
		}
		body > div > div > section > p {
			font-size: 18px;
		}
		.shiny-html-output.col-sm-12.shiny-bound-output > div > div > p {
			font-size: 18px;
			font-weight: bold;
		}
		.shiny-html-output.col-sm-6.shiny-bound-output div > div > p {
			font-size: 18px;
			font-weight: bold;
		}
		.shiny-html-output.col-sm-12.shiny-bound-output > div > div > h3 {
			font-size: 32px;
			font-weight: bold;
		}
		.shiny-html-output.col-sm-6.shiny-bound-output div > div > h3 {
			font-size: 32px;
			font-weight: bold;
		}
		.shiny-html-output.col-sm-12.shiny-bound-output div > div.icon-large {
			top: 5px;
			right: 20px;
			font-size: 60px;
			color: rgba(0, 0, 0, .20)
		}
		.shiny-html-output.col-sm-6.shiny-bound-output div > div.icon-large {
			top: 10px;
			right: 20px;
			font-size: 60px;
			color: rgba(0, 0, 0, .20)
		}
		.small-box.bg-green {
			background-color: #3fa320 !important; color: #FFFFFF !important;
		}
		.small-box.bg-orange {
			background-color: #bfbf01 !important; color: #FFFFFF !important;
		}
		.small-box.bg-red {
			background-color: #db494c !important; color: #FFFFFF !important;
		}
		.small-box.bg-purple {
			background-color: ##34393c !important; color: #FFFFFF !important;
		}
		")),

		img(src = 'boxflame.png', align = "left"),
		titlePanel("  Ferris State University"),
		p("This is a demonstration dashboard for the revised General Education program at Ferris State University. It has been created using Shiny and the R programming language. A full dashboard would contain several additional filters in the sidebar and operational instructions with advice on interpretation. This tool is meant to provide a clean and clear overview of the program's status."),
		fluidRow(
			valueBoxOutput("overallBox", width = 12)
		),
		fluidRow(
			valueBoxOutput("collBox", width = 6),
			valueBoxOutput("commBox", width = 6),
			valueBoxOutput("cultBox", width = 6),
			valueBoxOutput("divrBox", width = 6),
			valueBoxOutput("nsciBox", width = 6),
			valueBoxOutput("probBox", width = 6),
			valueBoxOutput("qualBox", width = 6),
			valueBoxOutput("ssocBox", width = 6)
		)

	)
)

server <- function(input, output) {
	myColor <- function(score) {
		if(score >= 3.4) {
			return("blue")
		}
		else if(score>=2.6) {
			return("green")
		}
		else if(score >= 1.8) {
			return("orange")
		}
		else if(score >= 1.0) {
			return("red")
		}
		else {
			return("purple")
		}
	}

	output$overallBox <- renderValueBox({
		valueBox(
			paste(sprintf("%0.2f", myData[as.integer(input$semester),10]),"±",sprintf("%0.2f",0.21),sep = " "), "OVERALL", icon = icon("list"),
			color = myColor(myData[as.integer(input$semester),10])
		)
	})
	output$collBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),2]), "Collaboration", icon = icon("handshake-o"),
			color = myColor(myData[as.integer(input$semester),2])
		)
	})
	output$commBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),3]), "Communication", icon = icon("comments"),
			color = myColor(myData[as.integer(input$semester),3])
		)
	})
	output$cultBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),4]), "Culture", icon = icon("book", lib = "glyphicon"),
			color = myColor(myData[as.integer(input$semester),4])
		)
	})
	output$divrBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),5]), "Diversity", icon = icon("globe", lib = "glyphicon"),
			color = myColor(myData[as.integer(input$semester),5])
		)
	})
	output$nsciBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),6]), "Natural Sciences", icon = icon("leaf", lib = "glyphicon"),
			color = myColor(myData[as.integer(input$semester),6])
		)
	})
	output$probBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),7]), "Problem Solving", icon = icon("wrench", lib = "glyphicon"),
			color = myColor(myData[as.integer(input$semester),7])
		)
	})
	output$qualBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),8]), "Quantitative Literacy", icon = icon("signal", lib = "glyphicon"),
			color = myColor(myData[as.integer(input$semester),8])
		)
	})
	output$ssocBox <- renderValueBox({
		valueBox(
			sprintf("%0.2f", myData[as.integer(input$semester),9]), "Self and Society", icon = icon("group"),
			color = myColor(myData[as.integer(input$semester),9])
		)
	})



}

shinyApp(ui, server)
