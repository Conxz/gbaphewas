#
# by Xiangzhen Kong @ MPI, Nijmegen
#
rm(list = ls())
library(shiny)
library(shinyalert)
library(scales)
library(DT)
#library()

server <- function(input, output, session) {
 
# TODO, add plots for brain imaging 
#  observeEvent(input$gba_cate, {
#    if(input$gba_cate=='Brain Imaging'){
#      insertTab(inputId = "tabs",
#                tabPanel("Dynamic", "This a dynamically-added tab"),
#                target = "ass_tab")
#    }
#    #else{
#    #  removeTab(inputId = "tabs", target = "ass_tab")
#    #}
#  })
  
  output$gbaPlot1 <- renderUI({
    addResourcePath('web', 'web')
    if(input$gba_skew=='Horizontal Skew'){
      dat_dir = 'web/has/'
      html_file = file.path(dat_dir, 'index.html')
      #html_file = 'http://conxz.net/'
    }else{
      dat_dir = 'web/vas/'
      html_file = file.path(dat_dir, 'index.html')
      #html_file = 'http://conxz.net/gbaphewas/vas/index.html'
    }
    
    #includeHTML(html_file)
    tags$iframe(src=html_file, height = 880,  width='100%', scrolling='no', frameBorder="0")

    })
  
  output$noteInfo <- renderText({
    paste("Results for ", input$gba_skew, ". Click nodes above for checking further details", sep='')
    
  })
  
  output$img <- renderUI({
    if(input$gba_skew=='Horizontal Skew'){
      dat_dir = './data/res_SkewsXY_conf_scanT1'
    }else{
      dat_dir = './data/res_SkewsXZ_conf_scanT1'
    }
    
    input_file = file.path(dat_dir, paste('bnf_FA_JHU_wm_beta.jpg', sep=""))
    
    if(!file.exists(input_file)){return()}
    
    bnf_FA_JHU_wm_beta.jpg
    tags$img(src = './data/res_SkewsXZ_conf_scanT1/bnf_FA_JHU_wm_beta.jpg')
    
  })
  
  output$gba_tbl <- DT::renderDataTable({
    
    if(input$gba_skew2=='Horizontal Skew'){
      dat_dir = './data/has'
      }else if(input$gba_skew2=='Vertical Skew'){
        dat_dir = './data/vas'
        }
    
    if(input$gba_cate=='Brain Imaging'){
      input_file = file.path(dat_dir, paste('Brain.csv', sep=""))
    }else if(input$gba_cate=='Cognitive Function'){
      input_file = file.path(dat_dir, paste('Cognitive.csv', sep=""))
    }else if(input$gba_cate=='Early Life Factor'){
      input_file = file.path(dat_dir, paste('Early.csv', sep=""))
    }else if(input$gba_cate=='Mental Health'){
      input_file = file.path(dat_dir, paste('Mental.csv', sep=""))
    }else if(input$gba_cate=='Sociodemographics'){
      input_file = file.path(dat_dir, paste('Socio.csv', sep=""))
    }else{
      shinyalert("Oops!", "This option was lost!", type = "warning")
      return()
    }
    
    if(file.exists(input_file)){
      gba_dat = read.csv(input_file)
      if(input$gba_cate=='Brain Imaging'){
        if(input$phewas_metric=='Gray Matter Volume'){
          gba_dat = gba_dat[gba_dat$Category=='T1 structural brain MRI',]
        }else if(input$phewas_metric=='White Matter FA'){
          gba_dat = gba_dat[grep(" FA in ", gba_dat$Description),]
        }else if(input$phewas_metric=='White Mater MD'){
          gba_dat = gba_dat[grep(" MD in ", gba_dat$Description),]
        }else if(input$phewas_metric=='White Matter MO'){
          gba_dat = gba_dat[grep(" MO in ", gba_dat$Description),]
        }else if(input$phewas_metric=='White Matter OD'){
          gba_dat = gba_dat[grep(" OD in ", gba_dat$Description),]
        }else if(input$phewas_metric=='White Matter L1'){
          gba_dat = gba_dat[grep(" L1 in ", gba_dat$Description),]
        }else if(input$phewas_metric=='White Matter L2'){
          gba_dat = gba_dat[grep(" L2 in ", gba_dat$Description),]
        }else if(input$phewas_metric=='White Matter L3'){
          gba_dat = gba_dat[grep(" L3 in ", gba_dat$Description),]
        }else if(input$phewas_metric=='White Matter ICVF'){
          gba_dat = gba_dat[grep(" ICVF in ", gba_dat$Description),]
        }
        else if(input$phewas_metric=='White Matter ISOVF'){
          gba_dat = gba_dat[grep(" ISOVF in ", gba_dat$Description),]
        }
      }
      DT::datatable(gba_dat, rownames=FALSE,
                    options = list(order=list(3, 'asc'),
                                   lengthMenu = c(15, 25, 40, 50), 
                                   pageLength = 40, 
                                   scrollY = '880px')
                    )
    }else{
      shinyalert("Oops!", "Data file was lost! Contact the developer", type = "warning")
      return()
    }
    
    })
  
  # end obsBrainPlot2
}

  