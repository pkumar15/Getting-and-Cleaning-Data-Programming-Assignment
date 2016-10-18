The original file is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download file from web and unzip to working directory

Read each file into R using "read.table"

Column headers are V1, V2, ... etc which is not very descriptive. The code replaces the column names in all input files.

Step 1: Merges the training and the test sets to create one data set Create a complete training dataset and complete test dataset with columns for subject id, activity id and features Combine the training and test dataset (which have the same columns) by stacking the two datasets

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement Keep only the columns that contain "mean" or "std" in the header name in addition to the columns for subject id and activity id

Step 3:Uses descriptive activity names to name the activities in the data set Merge in activity name using the activity id

Step 4: Appropriately labels the data set with descriptive variable names Substitute the full word for abbreviations to make the dataset easier to understand (ie "time" replaces "t")

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject First group by activity and subject then calculate the mean of each column Export the new dataset as a text file

The text file looks messy when opened using notepad. There are instructions for how to read the file back into R to double check the output is correct

==================================================================
From features_info.txt 
==================================================================
The metrics selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.






