#
# by Xiangzhen Kong @ MPI, Nijmegen
#
library(shiny)
library(shinyalert)
library(markdown)
library(DT)

ui <- navbarPage("Global Brain Asymmetry - Phenome Scan Results",
                 tabPanel("Interactive Visualization",
                          sidebarLayout(
                            sidebarPanel(
                              useShinyalert(),
                              selectInput("gba_skew",
                                          "Global Asymmetry Component:",
                                          choices = c('Horizontal Skew', 'Vertical Skew'),
                                          selected = 'Horizontal Skew')
                            ),
                            mainPanel(
                              h3("Phenome Scan Results in UK Biobank via PHESANT"),
                              htmlOutput("gbaPlot1"),
                              wellPanel(
                                span("Notes:",
                                     textOutput("noteInfo")
                                )
                              )
                              )
                            )
                          ),
                 
                 # start tabPanel
                 tabPanel("Query Table",
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("gba_skew2",
                                          "Global Asymmetry Component:",
                                          choices = c('Horizontal Skew', 'Vertical Skew')),
                              selectInput("gba_cate",
                                          "Select Variable Categoty:",
                                          choices = c('Brain Imaging', 
                                                      'Cognitive Function',
                                                      'Early Life Factor',
                                                      'Mental Health', 
                                                      'Sociodemographics')),
                              conditionalPanel(condition = "input.gba_cate=='Brain Imaging'",
                                               selectInput("phewas_metric",
                                                           "Imaging Metrics:",
                                                           choices = c('Gray Matter Volume', 
                                                                       'White Matter FA',
                                                                       'White Mater MD',
                                                                       'White Matter MO',
                                                                       'White Matter OD',
                                                                       'White Matter L1', 
                                                                       'White Matter L2',
                                                                       'White Matter L3',
                                                                       'White Matter ICVF',
                                                                       'White Matter ISOVF'))
                              )
                            ),
                            mainPanel(
                              tabsetPanel(id='ass_tab',
                                tabPanel("Association Table", 
                                         DT::dataTableOutput('gba_tbl'))
                                #conditionalPanel(condition = "input.gba_cate=='Brain Imaging'",
                                #tabPanel("Plot",
                                #        #fluidRow(imageOutput("gbaPlot2"))
                                #        fluidRow(uiOutput("img"))
                                #        )
                                #)
                                )
                              )
                            )
                 ),
                 # end tabPanel
                 
                 # start tabPanel About
                 tabPanel("About",
                          fluidRow(
                            column(1),
                            column(8,includeMarkdown("README.md"))
                            )
                          )
                 # end tabPanel About
                 
                 )

