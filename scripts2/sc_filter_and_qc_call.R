## grab args
args <- commandArgs(trailingOnly = TRUE)
rmarkdown::render("SingleCell_Filter_and_QC.Rmd", params = list(
    data_dir = args[1],
	scriptsfolder = args[2]
))