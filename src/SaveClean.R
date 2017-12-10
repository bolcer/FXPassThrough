#! /usr/bin/env Rscript 

## Graphs:
## Author: Cem Sinan Ozturk
## date: "12/9/2017"

# This script takes clean data from (created in SaveClean.R)

# Dependencies: 
# tidyverse

# Input: arg[1]: the source for CPI data as input (csv file or link to csv)
# Input: arg[2]: the source for FXrate data as input (csv file or link to csv)

# SaveClean: Take csv files,
#            Change column names,
#            Bind the datasets,
#            Arrange the dataset by date,
#            Add new columns cpi, fx_change, pass_through,
#            Clean infinity and NA values.
#
# Output: arg[3]: the name of the output file for combined datasets

main <- function(){
  
  library(tidyverse)

  
  args = commandArgs(trailingOnly=TRUE)
  
  cpi_index <- read_csv(args[1])
  fx_rate <- read_csv(args[2])
  data_name <- args[3]
  
  
  write_csv(cpi_index,"data/cpi_index")
  write_csv(fx_rate,"data/fx_rate")
  colnames(cpi_index)[which(colnames(cpi_index) %in% c("Value") )] <- c("cpi_index")
  colnames(fx_rate)[which(colnames(fx_rate) %in% c("Value") )] <- c( "FxRate")
  
  
  
  fx_cpi_dataM <- inner_join(fx_rate,cpi_index)
  
  
  fx_cpi_dataM <- fx_cpi_dataM %>% arrange(Date)
  
  fx_cpi_dataM <- fx_cpi_dataM %>%
    mutate(cpi = cpi_index/lag(cpi_index)-1)
  
  fx_cpi_dataM <- fx_cpi_dataM %>%
    mutate(fx_change = FxRate/lag(FxRate)-1)
  
  fx_cpi_dataM <- fx_cpi_dataM %>%
    mutate(pass_through = cpi/fx_change)  
  
  fx_cpi_dataM <- fx_cpi_dataM %>%
    filter(is.na(cpi) == F) %>%
    filter(is.na(fx_change) == F) %>% 
    filter(pass_through != Inf,pass_through != -Inf)
  
  
  write_csv(fx_cpi_dataM,paste0("results/",data_name))
  

}

main()
