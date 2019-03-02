# ----------------------------------------
# --       PROGRAM server_local.R       --
# ----------------------------------------
# USE: Session-specific variables and
#      functions for the main reactive
#      shiny server functionality.  All
#      code in this file will be put into
#      the framework inside the call to
#      shinyServer(function(input, output, session)
#      in server.R
#
# NOTEs:
#   - All variables/functions here are
#     SESSION scoped and are ONLY
#     available to a single session and
#     not to the UI
#
#   - For globally scoped session items
#     put var/fxns in server_global.R
#
# FRAMEWORK VARIABLES
#     input, output, session - Shiny
#     ss_userAction.Log - Reactive Logger S4 object
# ----------------------------------------

# -- IMPORTS --


# -- VARIABLES --


# -- FUNCTIONS --

base_filename <- reactive({
  paste0("Gene_Explorer_", Sys.Date())
})

ds1 <- reactive({
  exData$contrasts[[input$contrast]]
})

table_data <- function() {
  rbindlist(lapply(names(exData$contrasts), FUN = function(x) {
    df <- exData$contrasts[[x]] 
    df$Gene     <- rownames(df)
    df$Contrast <- x
    df %>% 
      select(Contrast, Gene, logFC, AveExpr, P.Value, adj.P.Val, Qvalue, NegativeLogP, Group) %>% 
      mutate_if(is.numeric, round, 4)
  }))
}

# -- MODULES --

callModule(downloadableTable, "tableId", ss_userAction.Log,
           filenameroot = base_filename,
           downloaddatafxns = list(csv = table_data,
                                   tsv = table_data),
           tabledata    = table_data,
           rownames     = FALSE)

# ----------------------------------------
# --          SHINY SERVER CODE         --
# ----------------------------------------

output$profile_plot <- renderCanvasXpress({
  pp <- ds1()
  if (!is.null(pp)) {
    profilePlot(pp, title = paste(input$contrast, sep = ""))
  }  else {
    canvasXpress(destroy = TRUE)
  }
})

### Volcano plot

output$volcano_plot <- renderCanvasXpress({
  vp <- ds1()
  if (!is.null(vp)) {
    volcanoPlot(vp, title = paste(input$contrast, sep = ""))
  }  else {
    canvasXpress(destroy = TRUE)
  }
})

### Explore Genes
output$gene_plot <- renderCanvasXpress({
  sel = input$genes
  if (!is.null(sel)) {
    dat <- exData$Log2CPM
    dat <- dat[rownames(dat) %in% sel,,drop = FALSE]
    des <- exData$smpAnnot$ReplicateGroup
    genePlot(dat, des, title = "Expression Plot")
  } else {
    canvasXpress(destroy = TRUE)
  }
})
