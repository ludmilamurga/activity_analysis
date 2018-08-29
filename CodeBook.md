This code book describes the variables, the data, and any transformations that were performed to clean up the data ollected from the accelerometers from the Samsung Galaxy S smartphone.

Overview
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Descriptions of original files

features.txt: Names of the 561 features 

activity_labels.txt: Classificator of 6 activities.

X_train.txt: 7352 observations of the 561 features.

subject_train.txt: A vector of 7352 IDs of the volunteer related to each of the observations in X_train.txt.

y_train.txt: A vector of 7352 IDs of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 observations of the 561 features.

subject_test.txt: A vector of 2947 IDs of the volunteer related to each of the observations in X_test.txt.

y_test.txt: A vector of 2947 sID of the activity related to each of the observations in X_test.txt.


Processing steps

- Train and test data from X_train.txt and X_test.txt were merged to the one data frame
- The features that exact contain "mean()" or "std()" were saved only in this data frame (features.txt > data frame > regex > filter of base data by indeces)
- Labels for train and test data from y_train.txt and y_test.txt were merged to the one data frame and then merged with classificator activity_labeles.txt.
The column with descreptive names was bind with base data frame
- Subjects for train and test data from subject_train.txt and subject_test.txt were merged to the one data frame and then were bind with base data frame
- The tidy data set was created containing the mean of each feature for each subject and each activity and saved to tidy_data.csv.
