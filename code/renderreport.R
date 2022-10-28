here::i_am("code/renderreport.R")

rmarkdown::render(here::here("code/allelefreqbySNP.Rmd"))

rmarkdown::render(here::here("code/McCarthybySNP.Rmd"))
