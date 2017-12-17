#! /usr/bin/env/ Rscript
# read_in_data_test.R
# Ivan Despot, Nov 2017
#
# This script reads in the data set: icu_data.csv into R from the commandline.
#
# Parameters: input file: https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Stat2Data/ICU.csv
#             output file: /data/icu_data.csv
#
# Usage example: Rscript read_in_data_test.R https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Stat2Data/ICU.csv /data/icu_data.csv
#
############

args <- commandArgs(trailingOnly = T)
input_file <- args[1]
output_file <- args[2]

main <- function(){
  #read in data from online link
  icu_data <- read.csv(input_file, header = T, sep = ",")
  
  #create a snapshot of the read in data.
  out = head(icu_data)
  print(out)
  
  write.csv(icu_data, output_file)
}

#call function
main()