#! /usr/bin/env Rscript 

## Graphs:
## Author: Cem Sinan Ozturk
## date: "12/9/2017"

# This script takes clean data from (created in SaveClean.R)

# Dependencies: 
# tidyverse

# Input: arg[1]: output file from SaveClean.R as input

# Graphs: Produce time trend for FX pass through for all vs depreciation periods.
#       
#
# Output: arg[2]: the name of the output files 
#         it produce two graphs,
#         one for all data (arg[2].png)
#         other for depreciation periods.('arg[2]'Depreciation.png)


main <- function(){
  
  library(tidyverse)
  
  # arg[1]: output file from addColumns.R as input
  # arg[2]: name of the file for trend figure
  
  args = commandArgs(trailingOnly=TRUE)
  fx_cpi_dataM <- read_csv(args[1])
  
  deflation_data <- fx_cpi_dataM %>%
    filter(cpi>0) %>%
    filter(fx_change >0)
  

  Trend <- fx_cpi_dataM %>%
    ggplot(aes(Date,pass_through)) +
    geom_smooth() + 
    geom_point(aes(color = fx_change )) + 
    theme(axis.text.x = element_text(angle=90,size = 3)) + 
    ylim(-1, 1) +
    ggtitle("FX PassThrough over All Periods")
  
  png(filename=paste0("results/figures/",args[2]))
  plot(Trend)
  dev.off()
  
  Trend_dep <- deflation_data %>%
    ggplot(aes(Date,pass_through)) +
    geom_smooth() + 
    geom_point(aes(color = fx_change )) + 
    theme(axis.text.x = element_text(angle=90,size = 3)) + 
    ylim(-1, 1) +
    ggtitle("FX PassThrough over Depreciation Periods")
  
  png(filename=paste0("results/figures/",args[2],"Depreciation"))
  plot(Trend_dep)
  dev.off()

}

main()