#! /usr/bin/env/ Rscript
# filter_data.R
# Ivan Despot, Nov 2017
#
# This script filters the raw data in the data set: ../data/icu_data.csv, by Age, 
#Infection, Emergency and Survive, and outputs the file as a csv.
#
# Parameters: input file: https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Stat2Data/ICU.csv
#             output file: /results/icu_data_filter.csv
# Usage: Rscript filter_data.R  /data/icu_data.csv results/icu_data_filter.csv
############

#Dependencies: tidyverse

#load dependencies (make sure command line reads correct path)
.libPaths(c("C:/Users/Ivan/Documents/R/win-library/3.4", "C:/Program Files/R/R-3.4.1/library" ))
library(tidyverse)

args <- commandArgs(trailingOnly = T)
input_file <- args[1]
output_file <- args[2]

# Define main function
main <- function(){

  #read in data
  icu_data <- read.csv(input_file)
  
  #filter the data of interest
  icu_data_filter <- icu_data %>% 
    select(Age, Infection, Emergency, Survive)
  
  #print snippet of filterd data
  print(head(icu_data_filter))
  
  #write new csv to results
  write.csv(icu_data_filter, output_file)

}

main()
