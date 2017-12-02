
library(tidyverse)
## requires three arguments,
# 1st is the source for CPI
# 2nd is the source for FXrate
# 3nd is the name of the binded output file

args = commandArgs(trailingOnly=TRUE)

cpi_index <- read_csv(args[1])

write_csv(fx_cpi_dataM,"bin/cpi_index")

colnames(cpi_index)[which(colnames(cpi_index) %in% c("Value") )] <- c("cpi_index")

fx_rate <- read_csv(args[2])

write_csv(fx_cpi_dataM,"bin/fx_rate")

colnames(fx_rate)[which(colnames(fx_rate) %in% c("Value") )] <- c( "FxRate")

fx_cpi_dataM <- inner_join(fx_rate,cpi_index)

fx_cpi_dataM <- fx_cpi_dataM %>% arrange(Date)

write_csv(fx_cpi_dataM,paste0("res/",args[3]))

