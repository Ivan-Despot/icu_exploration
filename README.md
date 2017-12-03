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

## Research Question:

I seek to determine which variables  are most predictive of survival in the ICU.

Null hypothesis: There is no difference in survival between the variables, and therefore, no predictions can be made.

Alternative hypothesis: There are significant differences between survival and at least one variable, which allows us to better predict outcome.

## Data Summary and Visualization:

I would first summarize the data by finding the mean differences between the groups. This will be our test statistic. Next, we will use ANOVA to test for significance with multiple comparisons.

Categorical data would be visualized in a bar chart (for example: Age group ~ Survival, Infection ~ Survival).

Discrete data would be visualized in a box plot (for example: Systolic Blood Pressure ~ Survival).

This information would be displayed in a facet.

## Author

Ivan Despot

November 2017
