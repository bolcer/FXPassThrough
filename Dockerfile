# Docker file for Fx Pass Through Project
# Cem Sinan Ozturk, Dec, 2017

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# then install the ezknitr packages
RUN Rscript -e "install.packages('ezknitr', repos = 'http://cran.us.r-project.org')"
