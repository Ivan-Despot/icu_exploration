# Makefile
# Ivan Despot
# December 2017
#
# Usage: type make to run analysis
#				type make clean to delete all files created
#
# run from top to bottom
all: results/icu_report.pdf

# import file and write csv
data/icu_data.csv: https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Stat2Data/ICU.csv
	Rscript src/read_in_data_test.R https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/Stat2Data/ICU.csv data/icu_data.csv

# filter data
results/icu_data_filter.csv: data/icu_data.csv
	Rscript src/filter_data.R data/icu_data.csv results/icu_data_filter.csv

# make plots
generate_plots: results/icu_data_filter.csv
	Rscript plot_data.R results/icu_data_filter.csv icu_exploration/results/

# generate report
results/icu_report.pdf: data/icu_data.csv results/icu_data_filter.csv generate_plots
	Rscript -e 'ezknitr::ezknit("src/icu_report.Rmd", out_dir = "results")'

# clean up intermediate files
clean:
	rm -f results/ *.csv
	rm -f data/ *.csv
	rm -f results/ *.png
	rm -f results/ *.pdf
