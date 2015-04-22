# Getting and Cleaning Data Course Project

You should create one R script called `run_analysis.R` that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the analysis

Just run the `run_analysis.R` present in this folder. This script will download the dependencies, the required data and do all the necessary proccess. At the end it will output a single `tidy.txt` file with the cleaned data.

## Dependencies

The code depends on the R package `reshape2`, downloaded by the script itself if needed.
