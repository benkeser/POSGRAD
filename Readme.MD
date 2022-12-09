
## Repository Contents
1) Code - folder with Rscripts necessary to render report
    - cleandata.R: generates analytic data set
    - allelefreqbySNP.Rmd: generates tables & visualizations of        allele frequencies for single nucelotide polymorphisms.   
    -McCarthybySNP.Rmd:generates tables & vizualizations of           McCarthy Cognitive Scores
    -renderreport:renders allelefreqbySNP and McCarthybySNP
2) Derived Data - data for these analyses lives here.
3) Makefile - establishes targets for Make.
4) dockerfile - neccessary for building the docker image.

## Report
To generate report, type "make report" in the terminal, first assuring you're in the folder containing the Makefile.

## Build Docker image
To build the Docker image type "make project_image" in the terminal.

## Automatically build report in Docker container
To build the report in the Docker container type "make final_report/report.html" in the terminal.

## Dockerhub
The project is also here on Dockerhub:
https://hub.docker.com/repository/docker/mchapnick/posgrad_report 