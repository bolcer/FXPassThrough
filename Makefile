# Driver script
# Cem Sinan Ozturk, Dec 2017
# Completes analysis of FX Pass Through top to bottom (from raw data to rendering report)
#
# usage: make all

# run all analysis
all: docs/Project_Report.md

## save:

results/allData: src/SaveClean.R
	Rscript src/SaveClean.R "https://www.quandl.com/api/v3/datasets/CBRT/TP_FG_TG01.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly" "https://www.quandl.com/api/v3/datasets/BOE/XUMLBK75.csv?api_key=tPKkRzbE46iPtm71hJM8&collapse=monthly" allData

# create plot
results/figures/Trend: results/allData src/Graphs.R
	Rscript src/Graphs.R results/allData Trend

results: results/allData src/Analysis.R
	Rscript src/Analysis.R results/allData linearModelResults

# make report
docs/Project_Report.md: src/Project_Report.Rmd results/allData results/figures/Trend results
	Rscript -e 'ezknitr::ezknit("src/Project_Report.Rmd", out_dir = "docs")'

# clean up intermediate files
clean:
	rm -f data/cpi_index
	rm -f data/fx_rate
	rm -f results/allData
	rm -f results/figures/Trend
	rm -f results/figures/TrendDepreciation
	rm -f docs/Project_Report.md
	rm -f docs/Project_Report.html
