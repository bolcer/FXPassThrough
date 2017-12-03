#!/bin/bash

## add data into project:

Rscript src/bindSave.R "https://www.quandl.com/api/v3/datasets/CBRT/TP_FG_TG01.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly" "https://www.quandl.com/api/v3/datasets/BOE/XUMLBK75.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly" cpiFx
