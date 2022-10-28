derived_data/POSGRADdata_merge.csv derived_data/POSGRADdata_merge_analytic.csv &: \
  raw_data/posgrad_offspring_cleaned_genetic_data.csv \
  raw_data/ja.csv raw_data/breastfeeding.csv \
  raw_data/Ses_home.csv
	Rscript code/cleandata.R

.PHONY: reports
reports: code/renderreport.r \
code/allelefreqbySNP.Rmd code/McCarthybySNP.Rmd \
derived_data/POSGRADdata_merge_analytic.csv
	Rscript code/renderreport.R

	
