#! /usr/bin/env/ Rscript
# plot_data.R
# Ivan Despot, Nov 2017
#
# ************This script filters the raw data in the data set: ../data/icu_data.csv, by Age, 
#Infection, Emergency and Survive, and outputs the file as a csv.
#
# Usage: Rscript plot_data.R 

#Dependencies: tidyverse, ggplot2, forcats

#load dependencies (make sure command line reads correct path)
.libPaths(c("C:/Users/Ivan/Documents/R/win-library/3.4", "C:/Program Files/R/R-3.4.1/library" ))
library(tidyverse)
library(ggplot2)
library(forcats)

main <- function(){
  #read in data
  plot_data <- read.csv("../results/icu_data_filter.csv")
  
  #create plot for Survive * Age
  age_plot <- ggplot(data = plot_data,
                     aes(y = Age, x = as.factor(Survive))) +
    geom_boxplot(colour = "blue", fill = "blue", alpha = 0.25,
                 outlier.colour = "red", outlier.fill = "red") +
    labs(x = "Survived", y = "Age (years)", title = "Age vs. Survival in the ICU") +
    geom_jitter(colour = "green", alpha = 0.3) +
    scale_x_discrete(labels = c("Survived", "Perished")) +
    stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) 
  
  # save plot
  ggsave(age_plot, file = "age_vs_survival_bxplt.PNG")
  
  #select data for Survive * Infection
  infection_sum <- plot_data %>% 
    select(Infection, Survive) %>% 
    mutate(Infection = as.factor(Infection), Survive = as.factor(Survive)) %>% 
    group_by(Infection, Survive) %>% 
    summarise(total = n())  
  
  #creat plot for Survive * Infection
  infection_plot <- ggplot(infection_sum, aes(x = Infection, y = total, fill = forcats::fct_recode(Survive, Perished = "0", Survived = "1"))) +
    geom_bar(position = "fill", stat = "identity") + 
    labs(x = "Infection", y = "Proportion", title = "Survivorship between infected and not infected patients") +
    scale_x_discrete(label = c("Not Present", "Infected")) +
    guides(fill = guide_legend(title = "Survival"))
  
  # save plot
  ggsave(infection_plot, file = "infection_survival_barchart.PNG")
  
  
  
  
  
  
  
}
