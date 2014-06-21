
GACD course project: run_analysis.R
=======


This repo contains data, scripts and metadata required for Coursera's Getting and Cleaning Data course project.

This Markdown document details how the scripting works for the run_analysis.R script.
 
This script assumes that that the UCI HAR Dataset has already been downloaded and unzipped from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.  It takes the dataset merges and transforms the raw dataset into table (tidy_data) that finds the average of each variable for each activity and subject.  The code will not run unless the working directory is set.

##How the script works##

1. Set the working directory to the directory the UCI HAR Dataset is located.
2. Set the training and test data to data objects in R.
3. Merge the data sets into a single table.
4. Label the data set using the descriptive variable names found in the features.txt.
5. Extracts only the measurements on the mean and standard deviation for each measurement. 
6. Label descriptive variable names for the activities using activity_labels.txt.
7. Create a new tidy data set with the average of each variable for each activity and each subject.


