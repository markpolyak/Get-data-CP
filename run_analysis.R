
# Task 1: merge the training and the test sets to create one data set.
# Task 2: extract only the measurements on the mean and standard deviation for each measurement. 
# Task 3: use descriptive activity names to name the activities in the data set
# Task 4: appropriately label the data set with descriptive variable names. 
# Task 5: from the data set in task 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)

# select only the measurements on the mean and standard deviation for each measurement (part of Task 2)
features <- read.table("UCI HAR Dataset/features.txt")
features.selected <- features[features$V2 %like% "mean\\(\\)" | features$V2 %like% "std\\(\\)", 1]

# load test data (part of Task 1)
test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
names(test.x) <- features[,2] # (part of Task 3)
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
names(test.y) <- c("activity") # (part of Task 3)
test.subj <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(test.subj) <- c("subject") # (part of Task 3)

# leave only the columns with mean and standard deviation on the test dataset (part of Task 2)
test.x.sel <- test.x[, features.selected]
test.sel <- cbind(test.subj, test.y, test.x.sel)

# load train data (part of Task 1)
train.x <- read.table("UCI HAR Dataset/train/X_train.txt")
names(train.x) <- features[,2] # (part of Task 3)
train.y <- read.table("UCI HAR Dataset/train/y_train.txt")
names(train.y) <- c("activity") # (part of Task 3)
train.subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(train.subj) <- c("subject") # (part of Task 3; Task 3 is finished)

# leave only the columns with mean and standard deviation on the train dataset (part of Task 2; Task 2 is finished)
train.x.sel <- train.x[, features.selected]
train.sel <- cbind(train.subj, train.y, train.x.sel)

# create human activity recognition dataset (part of Task 1; Task 1 is finished)
har_df <- rbind(test.sel, train.sel)


# Task 4
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
har_df$activity <- factor(har_df$activity, labels = activities[,2])
har_df$subject <- factor(har_df$subject)

# free memory
rm(activities, features, test.x, test.y, test.subj, test.x.sel, test.sel, train.x, train.y, train.subj, train.x.sel, train.sel)

# Task 5
avg_har <- ddply(har_df, .(subject, activity), function(x) colMeans(x[, 3:68]))

write.table(avg_har, "avg_har.txt", row.names = FALSE, quote = FALSE)
