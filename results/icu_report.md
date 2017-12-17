---
title: 'ICU Report'
author: "Ivan Despot"
date: "December 9, 2017"
output: github_document
---

Usage: Rscript -e 'ezknitr::ezknit("src/icu_report.Rmd", out_dir = "results")'


```r
.libPaths(c("C:/Users/Ivan/Documents/R/win-library/3.4", "C:/Program Files/R/R-3.4.1/library" ))
library(tidyverse)
```

```
## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr
```

```
## Conflicts with tidy packages ----------------------------------------------
```

```
## filter(): dplyr, stats
## lag():    dplyr, stats
```

```r
library(forcats)
library(ezknitr)
```

```
## Warning: package 'ezknitr' was built under R version 3.4.2
```




```r
#read in raw data
icu_data <- read.csv("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Stat2Data/ICU.csv", 
                       header = T, sep = ",")
```


```r
head(icu_data, 10)
```

```
##     X ID Survive Age AgeGroup Sex Infection SysBP Pulse Emergency
## 1   1  4       0  87        3   1         1    80    96         1
## 2   2  8       1  27        1   1         1   142    88         1
## 3   3 12       1  59        2   0         0   112    80         1
## 4   4 14       1  77        3   0         0   100    70         0
## 5   5 27       0  76        3   1         1   128    90         1
## 6   6 28       1  54        2   0         1   142   103         1
## 7   7 32       1  87        3   1         1   110   154         1
## 8   8 38       1  69        2   0         1   110   132         1
## 9   9 40       1  63        2   0         0   104    66         0
## 10 10 41       1  30        1   1         0   144   110         1
```


```r
#read in filtered data
icu_filter <- read.csv("../results/icu_data_filter.csv", header = T, sep = ",")
```

```
## Warning in file(file, "rt"): cannot open file '../results/
## icu_data_filter.csv': No such file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

```r
head(icu_filter, 10)
```

```
## Error in head(icu_filter, 10): object 'icu_filter' not found
```


**Age vs. Survival**
\begin{center}
\includegraphics{../results/age_vs_survival_bxplt}
\end{center}

This figure illustrates the relationship between patient age and survival as boxplots. The *red* diamond in each box indicates the mean age. Furthermore, the median age is represented by the blue vertical line in the center of the plot. A jitter plot was overlayed to assist with visualizing the counts in each factor for `survival`. Also, the spread of the ages among the `perished` factor is substantially larger than that of the `survived` factor. Interstingly, it appears that the mean age of those who perished in the ICU is lower than those that did not. One would expect that the more elderly patients would perish in the ICU. Further statistical analysis could determine the significance of this relationship.


**Infection vs. Survival**
\begin{center}
\includegraphics{../results/infection_survival_barchart}
\end{center}

This figure demonstrates how the patient's infection status impacts their survival in the ICU. We would expect that patients with infections typically do poorly in the ICU. These infections add another layer of challenges when treating these patients. The bar chart depicts the proportions of survivors in terms of their infection status. As we can see, over 25% of patients with an infection passed away **during** their stay at the ICU. Meanwhile, around 12% of patients without infections passed away **during** their stay.


**Emergency vs. Survival**
\begin{center}
\includegraphics{../results/emergency_survival_barchart}
\end{center}

An important factor when examining the survival rates in an ICU is the case type. These can be classified into two broad terms: emergency and elective. Elective is where it is decided that it is in the best interest of the patient to recieve treatment in the ICU, for close observation and care. On the otherhand, emergency cases occur at unpredictably, and the patient usually arrives in worse condition than the elective case patient who is typically already stabilized. From our graph, we can see a significant difference between the two case types. Emergency cases we associated with 25% of deaths in the ICU, while elective cases corresponded to less than < 10% of deaths.


```r
#for milestone 3
#ezknitr::ezknit("icu_report.Rmd", out_dir = "results")
```



