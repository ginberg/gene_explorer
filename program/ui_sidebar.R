# ----------------------------------------
# --       PROGRAM ui_sidebar.R         --
# ----------------------------------------
# USE: Create UI elements for the
#      application sidebar (left side on
#      the desktop; contains options) and
#      ATTACH them to the UI by calling
#      add_ui_sidebar_basic() or
#      add_ui_sidebar_advanced()
#
# NOTEs:
#   - All variables/functions here are
#     not available to the UI or Server
#     scopes - this is isolated
# ----------------------------------------

# -- IMPORTS --



# ----------------------------------------
# --     SIDEBAR ELEMENT CREATION       --
# ----------------------------------------

# -- Create Basic Elements

contrast_select <- selectizeInput("contrast", ui_tooltip('contrastTooltip', "Select Contrast", 'Pick a contrast'), 
                                  names(exData$contrasts))
genes_select    <- selectizeInput("genes", ui_tooltip('genesTooltip', "Select Gene(s)", 'Pick the Genes to plot'), gene_list, multiple = TRUE, selected = gene_list[1:2], 
                                  options  = list(placeholder = "Type/Click then Select", 
                                                  searchField = "value", 
                                                  plugins = list('remove_button')))

# -- Register Basic Elements in the ORDER SHOWN in the UI
add_ui_sidebar_basic(list(tags$br(),
                          contrast_select,
                          tags$br(),
                          genes_select))



# -- Create Advanced Elements


# -- Register Advanced Elements in the ORDER SHOWN in the UI
add_ui_sidebar_advanced(list(tags$br()))
