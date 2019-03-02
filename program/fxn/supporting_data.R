# ----------------------
# Data Related Functions
#-----------------------

loadData <- function(filename) {
  exData <- readRDS(filename)
  # format gene names: remove first underscore and all characters after that
  gsub_expression <- "_.*"
  rownames(exData$Log2CPM) <- gsub(gsub_expression, "", rownames(exData$Log2CPM))
  exData$contrasts <- lapply(exData$contrasts, FUN = function(x) {
    rownames(x) <- gsub(gsub_expression, "", rownames(x))
    return(x)
  })
  exData
}