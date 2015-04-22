# Code Book

This code book will describe the resources, data and transformations needed to cleanup the data.

## Datasource

The data for the project comes from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html), available at [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The full description of the data could be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Dataset Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Used data files

We process the following files:

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each train window sample;
- 'train/y_train.txt': The activity done at each train window sample.
- 'train/X_train.txt': The measurements of train window samples.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each test window sample;
- 'test/y_test.txt': The activity done at each test window sample.
- 'test/X_test.txt': The measurements of test window samples.

We also consume the `features.txt` and `activity_labels.txt`, each one containing the name of each test made and the labels for each activity requested.

## Data cleanup

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to Run

Just run the `run_analysis.R` script:

```shell
  $ Rscript run_analysis.R
```

