#! /usr/bin/env/ Rscript
# filter_data.R
# Ivan Despot, Nov 2017
#
# This script filters the raw data in the data set: ../data/icu_data.csv, by Age, 
#Infection, Emergency and Survive, and outputs the file as a csv.
#
# Usage: Rscript filter_data.R 

#Dependencies: tidyverse

#load dependencies (make sure command line reads correct path)
.libPaths(c("C:/Users/Ivan/Documents/R/win-library/3.4", "C:/Program Files/R/R-3.4.1/library" ))
library(tidyverse)

# Define main function
main <- function(){

  #read in data
  icu_data <- read.csv("../data/icu_data.csv")
  
  #filter the data of interest
  icu_data_filter <- icu_data %>% 
    select(Age, Infection, Emergency, Survive)
  
  #print snippet of filterd data
  print(head(icu_data_filter))
  
  #write new csv to results
  write.csv(icu_data_filter, "../results/icu_data_filter.csv")

}

main()
