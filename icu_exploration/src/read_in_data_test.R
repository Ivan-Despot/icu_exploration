#! /usr/bin/env/ Rscript
# read_in_data_test.R
# Ivan Despot, Nov 2017
#
# This script reads in the data set: icu_data.csv into R from the commandline.

main <- function(){
  
  icu_data <- read.csv("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Stat2Data/ICU.csv", 
                       header = T, sep = ",")
  
  #create a snapshot of the read in data.
  out = head(icu_data)
  print(out)
  
  write.csv(icu_data, "../data/icu_data.csv")
}

#call function
main()