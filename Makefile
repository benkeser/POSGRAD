## Generate data
derived_data/POSGRADdata_merge.csv derived_data/POSGRADdata_merge_analytic.csv &: \
  raw_data/posgrad_offspring_cleaned_genetic_data.csv \
  raw_data/ja.csv raw_data/breastfeeding.csv \
  raw_data/Ses_home.csv
	Rscript code/cleandata.R
	
## Build Report
report: report.Rmd code/renderreport.r \
allelefreq McCarthy \
derived_data/POSGRADdata_merge_analytic.csv
	Rscript code/renderreport.R

## Allele Frequency Figures
allelefreq: code/allelefreqbySNP.R \
derived_data/POSGRADdata_merge_analytic.csv
	Rscript code/allelefreqbySNP.R

## McCarthy Distrubtion Figure
McCarthy: code/McCarthybySNP.R \
derived_data/POSGRADdata_merge_analytic.csv
	Rscript code/McCarthybySNP.R

.PHONY: install
install: 
	Rscript -e "renv::restore(prompt = FALSE)"
