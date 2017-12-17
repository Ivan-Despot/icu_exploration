#! /usr/bin/env/ Rscript
# plot_data.R
# Ivan Despot, Nov 2017
#
# This script plots the filtered data in the data set: ../data/icu_data.csv, by Age, 
#Infection, Emergency and Survive, and outputs the file as a csv.
#
# Usage: Rscript plot_data.R results/icu_data_filter.csv icu_exploration/results/
#
#Dependencies: tidyverse, ggplot2, forcats
#
#load dependencies (make sure command line reads correct path)
.libPaths(c("C:/Users/Ivan/Documents/R/win-library/3.4", "C:/Program Files/R/R-3.4.1/library" ))
library(tidyverse)
library(ggplot2)
library(forcats)

args <- commandArgs(trailingOnly = T)
input_file <- args[1]
output_file <- args[2]

main <- function(){
  #read in data
  plot_data <- read.csv(input_file)
  
  #create plot for Survive * Age
  age_plot <- ggplot(data = plot_data,
                     aes(y = Age, x = as.factor(Survive))) +
    geom_boxplot(colour = "blue", fill = "blue", alpha = 0.25,
                 outlier.colour = "red", outlier.fill = "red") +
    labs(x = "Survived", y = "Age (years)", title = "Age vs. Survival in the ICU") +
    geom_jitter(colour = "green", alpha = 0.3) +
    scale_x_discrete(labels = c("Survived", "Perished")) +
    stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) 
  
  # save plot in results
  ggsave(age_plot, filename = "age_vs_survival_bxplt.PNG", path = output_file)
  
  #select data for Survive * Infection
  infection_sum <- plot_data %>% 
    select(Infection, Survive) %>% 
    mutate(Infection = as.factor(Infection), Survive = as.factor(Survive)) %>% 
    group_by(Infection, Survive) %>% 
    summarise(total = n())  
  
  #create plot for Survive * Infection
  infection_plot <- ggplot(infection_sum, aes(x = Infection, y = total, fill = forcats::fct_recode(Survive, Perished = "0", Survived = "1"))) +
    geom_bar(position = "fill", stat = "identity") + 
    labs(x = "Infection", y = "Proportion", title = "Survivorship between infected and not infected patients") +
    scale_x_discrete(label = c("Not Present", "Infected")) +
    guides(fill = guide_legend(title = "Survival"))
  
  # save plot in results
  ggsave(infection_plot, filename = "infection_survival_barchart.PNG", path = output_file)
  
  #select data from Survive * Emergency
  emerg_sum <- plot_data %>% 
    select(Emergency, Survive) %>% 
    mutate(Emergency = as.factor(Emergency), Survive = as.factor(Survive)) %>% 
    group_by(Emergency, Survive) %>% 
    summarise(total = n())  
  
  # create plot for Survive * Emergency
  emerg_plot <- ggplot(emerg_sum, aes(x = Emergency, y = total, fill = forcats::fct_recode(Survive, Perished = "0", Survived = "1"))) +
    geom_bar(position = "fill", stat = "identity") + 
    labs(x = "Case Type", y = "Proportion", title = "Survivorship between emergency and elected cases") +
    scale_x_discrete(label = c("Elective", "Emergency")) +
    guides(fill = guide_legend(title = "Survival"))
  
  # save plot in results
  ggsave(emerg_plot, filename = "emergency_survival_barchart.PNG", path = output_file)
  
  
}

main()
