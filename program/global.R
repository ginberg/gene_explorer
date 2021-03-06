# ----------------------------------------
# --          PROGRAM global.R          --
# ----------------------------------------
# USE: Global variables and functions
#
# NOTEs:
#   - All variables/functions here are
#     globally scoped and will be available
#     to server, UI and session scopes
# ----------------------------------------


# -- Setup your Application --
set_app_parameters(title = "Interactive Gene Explorer",
                   titleinfo = NULL,
                   loglevel = "DEBUG",
                   showlog = FALSE,
                   app_version = "1.0.0")

# -- PROGRAM --
library(canvasXpress)
library(dplyr)
library(markdown)
library(data.table)

source('program/fxn/supporting_data.R')

# load and prep the data
exData    <- loadData("program/data/data.rds")
gene_list <- rownames(exData$contrasts[[1]])