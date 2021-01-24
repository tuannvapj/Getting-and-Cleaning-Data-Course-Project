**Getting and Cleaning Data Course Project**
========================================

## Data for research
Using data from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It's supposed That goal is to extract data from the data source.

Data source included:
  1. ***features.txt*** - includes the descriptions for features measured
  2. ***train/X_train.txt*** - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
  3. ***test/X_test.txt*** - includes the measurements of the features in test set
  4. ***train/subject_train.txt*** - subject for each measurement from the train set
  5. ***test/subject_test.txt*** - subject for each measurement from the test set
  6. ***train/y_train.txt*** - activity (from 1 to 6) for each measurement from the train set
  7. ***test/y_test.txt*** - activity (from 1 to 6) for each measurement from the test set


## How script works
Script involves the following stages:

1. Downloads and merges the training and the test sets to create one data set. Use the fread function to read data, and combine data with rbind, cbind

2. Extracts only the measurements on the mean and standard deviation for each measurement. Use the grepl funtion to select with the mean and standard deviation variable

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. User the merge to appropriately labels

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use melt and dcast to create tiny data

