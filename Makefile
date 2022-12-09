## Rules to be run in Docker container 

## Generate data
derived_data/POSGRADdata_merge.csv derived_data/POSGRADdata_merge_analytic.csv &: \
  raw_data/posgrad_offspring_cleaned_genetic_data.csv \
  raw_data/ja.csv raw_data/breastfeeding.csv \
  raw_data/Ses_home.csv
	Rscript code/cleandata.R
	
## Build Report
report: report.Rmd code/renderreport.R \
allelefreq McCarthy \
derived_data/POSGRADdata_merge.csv \
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

## Update R Packages
.PHONY: install
install: 
	Rscript -e "renv::restore(prompt = FALSE)"

#Docker Rules (to be run on local machine)
PROJECTFILES = derived_data/POSGRADdata_merge.csv derived_data/POSGRADdata_merge_analytic.csv \
raw_data/posgrad_offspring_cleaned_genetic_data.csv raw_data/ja.csv raw_data/breastfeeding.csv \
raw_data/Ses_home.csv report.Rmd code/renderreport.R \
code/allelefreqbySNP.R code/McCarthybySNP.R Makefile README.Rmd report.RMD \

RENVFILES = renv.lock renv/activate.R renv/settings.dcf

# Build the project image
project_image: dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t posgrad_report .
	touch $@

# Build report automatically in docker container
final_report/report.html:
	docker run -v "/$$(pwd)/final_report":/posgrad/final_report posgrad_report
