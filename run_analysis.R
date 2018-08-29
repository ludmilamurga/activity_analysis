data_train <- read.table("D:/_R/course/course3/UCI HAR Dataset/train/X_train.txt",stringsAsFactors = FALSE, header = F)
data_test <- read.table("D:/_R/course/course3/UCI HAR Dataset/test/X_test.txt",stringsAsFactors = FALSE, header = F)
# 1. Merges the training and the test sets to create one data set.
data_full <- rbind(data_train,data_test)
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features_list_full <- read.table("D:/_R/course/course3/UCI HAR Dataset/features.txt",stringsAsFactors = FALSE, header = F)
features_list <- features_list_full[grepl("mean\\(\\)|std\\(\\)",features_list_full$V2),]
data <- data_full[,features_list$V1]
names(data) <- features_list$V2
# 3. Uses descriptive activity names to name the activities in the data set
labels_train <- read.table("D:/_R/course/course3/UCI HAR Dataset/train/y_train.txt",stringsAsFactors = FALSE, header = F)
labels_test <- read.table("D:/_R/course/course3/UCI HAR Dataset/test/y_test.txt",stringsAsFactors = FALSE, header = F)
labels <- rbind(labels_train,labels_test)
label_names <- read.table("D:/_R/course/course3/UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE, header = F)
activities_labels<-merge(labels,label_names)
# 4. Appropriately labels the data set with descriptive variable names.
data <- cbind(activities_labels$V2,data)
colnames(data)[1]<-"activity"
subjects_train <-read.table("D:/_R/course/course3/UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE, header = F)
subjects_test <-read.table("D:/_R/course/course3/UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE, header = F)
subjects <- rbind(subjects_train,subjects_test)
data <- cbind(subjects$V1,data)
colnames(data)[1]<-"subject"
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summary_data <-  aggregate(. ~ subject + activity, data = data, mean, na.rm = TRUE)
# 6. Savind tidy data in csv file
write.csv(summary_data,"D:/_R/course/course3/UCI HAR Dataset/tidy.csv")
