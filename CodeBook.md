## Code book
This book contains variables and original files that has been used in the run_analysis.R code.

### Input data
* X_train.txt contains variable features that are intended for training.
* y_train.txt contains the activities corresponding to X_train.txt.
* subject_train.txt contains information on the subjects from whom data is collected.
* X_test.txt contains variable features that are intended for testing.
* y_test.txt contains the activities corresponding to X_test.txt.
* subject_test.txt contains information on the subjects from whom data is collected.
* activity_labels.txt contains metadata on the different types of activities.
* features.txt contains the name of the features in the data sets.

### Transformations
* x_train: read from file X_train.txt 
* y_train: read from file y_train.txt
* subject_train: read from file subject_train.txt
* x_test: read from file X_test.txt 
* y_test: read from file y_test.txt 
* subject_test: read from file subject_test.txt 
* feature: read from file features.txt
* activity_labels: read from file activity_labels.txt

### Output data set 
* combined_data: Answer for step 1. Contains all the training and test data set of activity, feature variables and subject
* selected_data: Answer for step 2. Based on combined_data,selected the measures with "mean()" and "std()" in names
* merged_data: Answer for step 3 and 4. Based on selected_data, merges with activity labels
* avg_data: Answer for step 5 and was output as "tidy_data.txt". 
