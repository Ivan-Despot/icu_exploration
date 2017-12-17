# Exploration of Data from the Intensive Care Unit (ICU)
  The Intensive Care Unit is responsible for some of the most ill patients in the hospital environment. The outcomes are often very poor, and the overall mortality rate is approximately 50%. Doctors and researchers continue to study ways of improving these outcomes.

  For this project, I will analyze the Intensive Care Unit (ICU) data set from the **Stat2Data** package in R. This public data set contains a sample of 200 patients, and 9 variables. Some examples are as follows:

  * Patient ID Code
  * Age (in years)
  * Age Group (1 = Young[under 50]; 2 = Middle[50-69]; 3 = Old[70+])
  * Survival (1 = Lived to be Discharged; 0 = Deceased)

## How to use this pipeline:

This project uses Docker. Please make sure you have cloned this repository and installed Docker. To run the analysis, enter the following *general* text into the Docker command line:

`docker run --rm -it -v /path-to-the-cloned-repo-on-your-computer/icu_exploration:/home/data_analysis_eg ivandespot/icu_exploration make -C '/home/data_analysis_eg'`

To delete all of the files created by the analysis pipeline, run the following command in Docker:

`docker run --rm -it -v /path-to-the-cloned-repo-on-your-computer/icu_exploration:/home/data_analysis_eg ivandespot/icu_exploration make -C '/home/data_analysis_eg' clean`

## Research Question:

We seek to determine how an individuals age, infection status, and case type impact survival in the ICU.

Null hypothesis: There is no difference in survival between the variables, and therefore, no predictions can be made.

Alternative hypothesis: There are significant differences between survival and at least one variable, which allows us to better predict outcome.

## Data Summary and Visualization:

Data will be filtered according to infection status, case type and age. Categorical data would be visualized in a bar chart (for example: Age ~ Survival). Discrete data would be visualized in a box plot (for example: Infection ~ Survival).

Our visualizations suggest that there are noticable differences in the survival rate depending on the case type, infection status, and age.

## Author

Ivan Despot

November 2017
