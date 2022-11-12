README
================
Melissa Chapnick
2022-10-23

## Repository Contents

1)  Derived Data - data for these analyses lives here!
2)  Code - folder with Rscripts necessary to render report
    -   cleandata.R: generates analytic data set
    -   allelefreqbySNP.Rmd: generates tables & visualizations of allele
        frequencies for single nucelotide polymorphisms.  
        -McCarthybySNP.Rmd:generates tables & vizualizations of McCarthy
        Cognitive Scores -renderreport:renders allelefreqbySNP and
        McCarthybySNP  
3)  Makefile - establishes targets for Make.

## Report

To build, run “make reports” in the terminal.

Two separate reports (allelefreqbySNP and McCarthybySNP) will generate
and be stored in code/.

## Restore R Package Environment

To restore R package environment, run "make install" in the terminal.

