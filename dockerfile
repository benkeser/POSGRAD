# Start with r-ubuntu image
FROM rocker/r-ubuntu

# Install necessary software
RUN apt-get update
RUN apt-get install -y pandoc

# Create project directory
RUN mkdir /posgrad
WORKDIR /posgrad

#Add files
COPY Makefile /posgrad
COPY README.Rmd /posgrad
COPY report.Rmd /posgrad
COPY 2_POSGRAD_Analysis.Rproj /posgrad

RUN mkdir raw_data
COPY raw_data/posgrad_offspring_cleaned_genetic_data.csv /posgrad/raw_data
COPY raw_data/ja.csv raw_data /posgrad/raw_data
COPY raw_data/breastfeeding.csv raw_data /posgrad/raw_data
COPY raw_data/Ses_home.csv raw_data /posgrad/raw_data

RUN mkdir derived_data
COPY derived_data/POSGRADdata_merge.csv derived_data /posgrad/derived_data
COPY derived_data/POSGRADdata_merge_analytic.csv derived_data /posgrad/derived_data

RUN mkdir code
COPY code/cleandata.R code /posgrad/code
COPY code/allelefreqbySNP.R code /posgrad/code
COPY code/McCarthybySNP.R code /posgrad/code
COPY code/renderreport.R code /posgrad/code

RUN mkdir output
COPY output/figure_1535.rds /posgrad/output
COPY output/figure_174602.rds /posgrad/output
COPY output/figure_composite.rds /posgrad/output

# Add files specific to renv
COPY .Rprofile /posgrad
COPY renv.lock /posgrad

RUN mkdir renv
COPY renv/settings.dcf /posgrad/renv
COPY renv/activate.R /posgrad/renv

#Duplicate R package environment
RUN Rscript -e "renv::restore(prompt = FALSE)"

# Make final report directory
RUN mkdir final_report

# Generate report and save to final report directory
CMD make report && mv report.html final_report
