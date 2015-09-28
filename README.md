# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, assumes that the source data from getdata_projectfiles_UCI HAR Dataset.zip is unpacked in the same directory as the R script is located in.

The script does the following:

1. Reads a list of features from `features.txt` and selects ones with mean and std (meanFreq not included as it is not a "mean of a measurement" as stated in the course project task but rather a mean of measuremnt's frequency)
2. Load, lable and join the test data: activity, subject and features, - keeping only those columns which reflect a mean or standard deviation
3. Load, lable and join the train data: activity, subject and features, - keeping only those columns which reflect a mean or standard deviation
4. Join test and train data
5. Convert activities and subjects to factors and add labels to activities
6. Create a tidy dataset with a mean of each variable in the dataset for each activity and each subject
7. Save the tidy dataset in a file.

The final dataset is saved in the file `avg_har.txt`.
=======
# Get-data-CP
Coursera "Getting Data" course project
