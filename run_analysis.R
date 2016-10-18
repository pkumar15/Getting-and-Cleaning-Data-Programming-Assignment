install.packages(dplyr)
library(dplyr)

## download and unzip file ##

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./assignment4.zip")
unzip("./assignment4.zip")

## read each file into R ##

features <- read.table("./UCI HAR Dataset/features.txt", sep="")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
training_set <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
training_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="")
training_subject_id <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="")
test_subject_id <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")

## label column headers ##

colnames(activity_labels) <- c("activity_id", "activity")
colnames(training_labels) <- c("activity_id")
colnames(training_subject_id) <- c("subject_id")
colnames(training_set) <- features[,2]
colnames(test_labels) <- c("activity_id")
colnames(test_subject_id) <- c("subject_id")
colnames(test_set) <- features[,2]

## Step 1: merge training and test data sets ##

training_data <- cbind(training_subject_id,training_labels, training_set)
test_data <- cbind(test_subject_id, test_labels, test_set)

merged_data <- rbind(training_data, test_data)

## Step 2: extracts columns that end in "mean" or std" ##

mean_std_col_names <- grep("*mean*|*std*", names(merged_data), ignore.case = TRUE) ## only columns with mean and st ##
desired_col_names <- c(1,2,mean_std_col_names) ## include activity id and subject id columns ##
data_subset <- merged_data[,desired_col_names]

## Step 3: Uses descriptive activity names to name the activities in the data set ##

activity_labels <- merge( data_subset, activity_labels, by = "activity_id")
activity_labels <- select(activity_labels,-(activity_id))

## Step 4: label dataset with descriptive names ##

names(activity_labels) <- gsub("^t","Time",names(activity_labels))
names(activity_labels) <- gsub("^f","Frequency",names(activity_labels))
names(activity_labels) <- gsub("Acc","Acceleration",names(activity_labels))
names(activity_labels) <- gsub("gyro","gyroscope",names(activity_labels))


## Step 5: new data set with average of each variable for each activity and each subject ##

avg_by_activity_subject <- (activity_labels %>%
  group_by(activity, subject_id) %>%
  summarize_each(funs(mean)))

write.table(avg_by_activity_subject,file = "avg.txt", row.name=FALSE)

## to read the file back into R ##

data <- read.table("./avg.txt", header = TRUE) 
View(data)

