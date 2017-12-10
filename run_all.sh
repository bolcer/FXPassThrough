#!/bin/bash

## add data into project:

Rscript src/SaveClean.R "https://www.quandl.com/api/v3/datasets/CBRT/TP_FG_TG01.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly" "https://www.quandl.com/api/v3/datasets/BOE/XUMLBK75.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly" allData
Rscript src/Graphs.R results/allData Trend
Rscript src/Analysis.R results/allData linearModelResults

# create report
Rscript -e 'ezknitr::ezknit("src/Project_Report.Rmd", out_dir = "docs")'
