#Step 1: Import Activity label
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", quote="\"")

#Step 2: Assign labels to columns
names(activity_labels) <- c("ActivityId", "ActivityName")

#Step 3: Import feature list
features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")

#Step 4: Assign labels to columns
names(features) <- c("FeatureId", "FeatureName")

#Step 5: Import X-training data
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"")

#Step 6: Assign names to columns from feature list
names(X_train) <- features$FeatureName

#Step 7: Import y-training data 
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"")

#Step 8: Assign label to column
names(y_train) <- c("ActivityId")

#Step 9: Import subject training data
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"")

#Step 10: Assign label to column
names(subject_train) <- c("SubjectId")

#Step 11: Import X-test data
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"")

#Step 12: Assign names to column from feature list
names(X_test) <- features$FeatureName

#Step 13: Import y-test data
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"")

#Step 14: Assign label to column
names(y_test) <- c("ActivityId")

#Step 15: Import subject-test data
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"")

#Step 16: Assign label to column
names(subject_test) <- c("SubjectId")


#Step 17: Combine training and testing data for X, y and subject
Xdata <- rbind(X_test,X_train)
ydata <- rbind(y_test,y_train)
subjectdata <- rbind(subject_test,subject_train)

#Step 18: Extract mean and std from measurements from X and assign activity labels for y
Xdata <- Xdata[,grep('mean|std',features$FeatureName)]
ydata$ActivityId <- activity_labels[ydata$ActivityId,]$ActivityName

#Step 19: Create tidydata
tidydata <- cbind(subjectdata,ydata,Xdata)

#Step 20: Export tidydata
write.table(tidydata,"tidydata.txt")

#Step 21: Take averages by grouping
averagedata <- aggregate(x = tidydata, by = list(tidydata$SubjectId, tidydata$ActivityId), FUN = "mean")

#Step 22: Export the averaged tidyset
write.table(averagedata,"averagedata.txt")