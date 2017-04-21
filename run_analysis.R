## working directory and packages setting
wd <- 'C:/Users/mdlyz/Desktop/UCI HAR Dataset'
setwd(wd)
library(data.table)

## Merges the training data and the test sets to create one data set
y_test <- data.table(read.table('./test/y_test.txt', header=F))
x_test <- data.table(read.table('./test/X_test.txt', header=F))
subject_test <- data.table(read.table('./test/subject_test.txt', header=F))

y_train <- data.table(read.table('./train/y_train.txt', header=F))
x_train <- data.table(read.table('./train/X_train.txt', header=F))
subject_train <- data.table(read.table('./train/subject_train.txt', header=F))

features <- read.table('./features.txt')

all_subject <- rbind(subject_train,subject_test)
x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
names(all_subject) <- 'subject'
names(x) <- as.character(features$V2)
names(y) <- 'activity'
combined_data <- cbind(x,y,all_subject)

## Extracts only the measurements on the mean and the standard deviation for each measurement
mean_std_select <- grep("mean\\(\\)|std\\(\\)",names(x))
all_select <- c(mean_std_select,562,563)
selected_data <- combined_data[,all_select,with=FALSE]

## Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table('./activity_labels.txt')
names(activity_labels) <- c('activity','act_label')
merged_data <- merge(selected_data,activity_labels,by="activity",all=T)
new_order <- c(names(merged_data)[-1],'activity')
setcolorder(merged_data,new_order)

## Appropriately labels the data set with descriptive variable names
names(merged_data)<-gsub("Acc", "Accelerometer", names(merged_data))
names(merged_data)<-gsub("Gyro", "Gyroscope", names(merged_data))
names(merged_data)<-gsub("BodyBody", "Body", names(merged_data))
names(merged_data)<-gsub("Mag", "Magnitude", names(merged_data))
names(merged_data)<-gsub("^t", "Time", names(merged_data))
names(merged_data)<-gsub("^f", "Frequency", names(merged_data))
names(merged_data)<-gsub("tBody", "TimeBody", names(merged_data))
names(merged_data)<-gsub("-mean\\(\\)", "Mean", names(merged_data), ignore.case = TRUE)
names(merged_data)<-gsub("-std\\(\\)", "STD", names(merged_data), ignore.case = TRUE)
names(merged_data)<-gsub("-freq\\(\\)", "Frequency", names(merged_data), ignore.case = TRUE)
names(merged_data)<-gsub("angle", "Angle", names(merged_data))
names(merged_data)<-gsub("gravity", "Gravity", names(merged_data))

## From the data set in step 4 create a second, independent tidy data set 
##     with the average of each variable for each activity and each subject
avg_data <- aggregate(merged_data[,1:(ncol(merged_data)-3)],
                                    by=list(subject=merged_data$subject,
                                            activity=merged_data$activity),
                                    mean)
write.table(avg_data,file='tidy_data.txt',row.names = FALSE)
