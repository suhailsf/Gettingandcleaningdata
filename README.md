Gettingandcleaningdata
======================
#Step 1: Import Activity label

#Step 2: Assign labels to columns

#Step 3: Import feature list

#Step 4: Assign labels to columns

#Step 5: Import X-training data

#Step 6: Assign names to columns from feature list

#Step 7: Import y-training data 

#Step 8: Assign label to column

#Step 9: Import subject training data

#Step 10: Assign label to column

#Step 11: Import X-test data

#Step 12: Assign names to column from feature list

#Step 13: Import y-test data

#Step 14: Assign label to column

#Step 15: Import subject-test data

#Step 16: Assign label to column

#Step 17: Combine training and testing data for X, y and subject

#Step 18: Extract mean and std from measurements from X and assign activity labels for y

#Step 19: Create tidydata

#Step 20: Export tidydata

#Step 21: Take averages by grouping

#Step 22: Export the averaged tidyset

#Step 20: Export tidydata
write.table(tidydata,"tidydata.txt")

#Step 21: Take averages by grouping
averagedata <- aggregate(x = tidydata, by = list(tidydata$SubjectId, tidydata$ActivityId), FUN = "mean")

#Step 22: Export the averaged tidyset
write.table(averagedata,"averagedata.txt")
