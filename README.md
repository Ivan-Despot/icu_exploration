# Exploration of Data from the Intensive Care Unit (ICU)
  The Intensive Care Unit is responsible for some of the most ill patients in the hospital environment. The outcomes are often very poor, and the overall mortality rate is approximately 50%. Doctors and researchers continue to study ways of improving these outcomes.

  For this project, I will analyze the Intensive Care Unit (ICU) data set from the **Stat2Data** package in R. This public data set contains a sample of 200 patients, and 9 variables. Some examples are as follows:

  * Patient ID Code
  * Age (in years)
  * Age Group (1 = Young[under 50]; 2 = Middle[50-69]; 3 = Old[70+])
  * Survival (1 = Lived to be Discharged; 0 = Deceased)

## How to load in the data:

In your command line, while in the directory for this project -  run the following:

`Rscript read_in_data_test.R`

This script will read in the ICU dataset, and write a new file named `icu_data.csv` in the `data` folder.

## How to create the clean data set:

After you have run the `read_in_data_test.R` script, you can use the `filter_data.R` script to create a new file in the **results** directory: `icu_data_filter.csv`. This script takes in the original `icu_data.csv` file, and cleans it up!

## How to generate the plots:

To create a few plots of the data, run `plot_data.R` in your command line. This script will take the cleaned data set (`icu_data_filter.csv`) and output three graphs in the **results** directory.

## Putting it all together:
To create a summary report of all of the steps and findings, you can open the `icu_report.Rmd` file in the `src` directory. This file will knit the results into a summary PDF.

## Research Question:

We seek to determine how an individuals age, infection status, and case type impact survival in the ICU.

Null hypothesis: There is no difference in survival between the variables, and therefore, no predictions can be made.

Alternative hypothesis: There are significant differences between survival and at least one variable, which allows us to better predict outcome.

## Data Summary and Visualization:

I would first summarize the data by finding the mean differences between the groups. This will be our test statistic. Next, we will use ANOVA to test for significance with multiple comparisons.

Categorical data would be visualized in a bar chart (for example: Age ~ Survival).

Discrete data would be visualized in a box plot (for example: Infection ~ Survival).

## Author

Ivan Despot

November 2017
