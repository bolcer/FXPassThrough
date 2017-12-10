#! /usr/bin/env Rscript 

## ANALYSIS
## Author: Cem Sinan Ozturk
## date: "12/8/2017"

# This script takes clean data from (created in SaveClean>r)

# Dependencies: 
# tidyverse

# Input: arg[1]: output file from SaveClean.R  as input

# Analysis:
# Linear Regression Model For all data
# Linear Regression Model For depreciation periods.
#
# Output: arg[2]: the name of the output file 

library(tidyverse)

args = commandArgs(trailingOnly=TRUE)
all_data <- read_csv(args[1])
out <- args[2]
deflation_data <- all_data %>%
    filter(cpi>0) %>%
    filter(fx_change >0)

sink(file=paste0("results/",out,".txt"))
  summary(lm(cpi ~ lag(cpi) + fx_change +lag(fx_change), data = all_data))
  summary(lm(cpi ~ lag(cpi) + fx_change, data = deflation_data))
sink()


