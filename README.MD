## Getting and cleaning data
###Files in this repo
There are 3 files contained in this repo.
*README.md -- Instruction of files, methodology and comments
*CodeBook.md -- Detailed instruction on variables and data
*run_analysis.R -- R code 

###Methodology of run_analysis.R
0. Preparation
*Set the working directory
*Lode packages including "data.table"
1. Merges the training and the test sets to create one data set.
*Read data from the working directory and store them as data tables
*The data being read are x_train, x_test, y_train, y_test, subject_train, subject_test and features
*Rename X columns by feature
*Combine the traning set and test set, then combine X, y and subject
*The result data set is named "combined_data"
2. Extracts only the measurements on the mean and standard deviation for each measurement.
*Search the names of data set and filter out ones with "mean()" or "std()" using grep() command
*The new data is called "selected_data"
3. Uses descriptive activity names to name the activities in the data set\
*Load the activity labels from working directory
*Merge the selected_data and activity labels using merge() command
*The "subject", "activity", "act_name" columns are put at the end of data set
4. Appropriately labels the data set with descriptive activity names.
*Tidy the name list by removing all non-alphanumeric characters and converting the result to lowercase using gsub() command
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
*Using aggregate() command to group the data by activity and subject, then take the mean for every level
*Output the data set and name it "tidy_data.txt"