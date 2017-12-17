# Dockerfile
# Ivan Despot
# December 2017

# use rocker/tidyverse as base image and
FROM rocker/tidyverse

# then install the ezknitr, packrat, and forcats packages

RUN Rscript -e "install.packages('ezknitr', repos = 'http://cran.us.r-project.org')"

RUN Rscript -e "install.packages('packrat', repos = 'http://cran.us.r-project.org')"

RUN Rscript -e "install.packages('forcats', repos = 'http://cran.us.r-project.org')"
