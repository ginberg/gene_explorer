# ----------------------------------------
# --          PROGRAM ui_body.R         --
# ----------------------------------------
# USE: Create UI elements for the
#      application body (right side on the
#      desktop; contains output) and
#      ATTACH them to the UI by calling
#      add_ui_body()
#
# NOTEs:
#   - All variables/functions here are
#     not available to the UI or Server
#     scopes - this is isolated
# ----------------------------------------

# -- IMPORTS --



# ----------------------------------------
# --      BODY ELEMENT CREATION         --
# ----------------------------------------

# -- Create Elements

body1 <-box(id     = "readmeBox",
            title  = tags$b("Dataset and application properties"),
            width  = 12,
            status = "info",
            collapsible = T,
            collapsed   = T,
            includeMarkdown("README.md")
)

body2 <- box(id     = "tabContainer",
             title  = NULL,
             width  = 12,
             status = "primary",
             collapsible = FALSE,
             collapsed   = FALSE,
             tabsetPanel(id = "tabs", 
                         selected = "Contrast plots",
                         tabPanel(title = "Contrast plots",
                                            canvasXpressOutput("profile_plot", width = "100%", height = "500"), 
                                            tags$hr(),
                                            canvasXpressOutput("volcano_plot", width = "100%", height = "500")),
                         tabPanel(title = "Gene plots",
                                            canvasXpressOutput("gene_plot", width = "100%", height = "750")),
                         tabPanel(title = "Data", downloadableTableUI("tableId", 
                                                                      downloadtypes = c("csv", "tsv"),
                                                                      contentHeight = "650px"))
             ))


# -- Register Elements in the ORDER SHOWN in the UI
add_ui_body(list(body1, body2))
