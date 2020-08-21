#This is the required script
#First and foremost we should check the existence of the required libraries 
require(dplyr)
require(tidyr)
#Secondly,we should download our data set zip file
filename <- "GCD_Project_Final.zip"
# Check if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  
# Check if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}
#Import activity labels and features TXT file to our environment, naming significant columns with descriptive labels

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("ActivityLabel","ActivityName"))
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
#Import our training data set, vectors of values from the X_train file and the correspondant subjects to each vector from y_train file, naming significant columns with descriptive labels

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = c("Subject"))
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features$V2)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = c("ActivityLabel"))

#Now all of the necessary data frames are imported, we start making our final data set
#Step 1 : We merge then the data frame that resulted from coersing X_train,y_train to link each vector of values with the corresponding activity  

final_train <-merge(
  cbind(subject_train,y_train,X_train)
  ,activity_labels,by = "ActivityLabel")

#We follow the same previous steps for the test dataset

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("Subject"))
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features$V2)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = c("ActivityLabel"))
final_test <-merge(
  cbind(subject_test,y_test,X_test)
  ,activity_labels,by = "ActivityLabel")

#The final dataset is obtained from rows binding the training and the test datasets  

merged_data <- rbind(final_train,final_test)[,c(2,564,3:563)]

#Step 2 : We select the wanted measurements 

TidyData <- merged_data %>% select(Subject, ActivityName, contains("mean"), contains("std"))

#Step 3 : Uses descriptive activity names to name the activities in the data set

#This step was already realized in the first step while creating final_train anf final_test

#Step 4 : Appropriately labels the data set with descriptive variable names


names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

#Step 5 : Finally, we create a second, independent tidy data set with the average of each variable for each activity and each subject.

Finaldataset <-
  spread(
    summarize(
      group_by(
        gather(tbl_df(TidyData), key = "var",value = "value",-(Subject:ActivityName))
        ,Subject,ActivityName,var),mean = mean(value))
          ,var,mean)

write.table(Finaldataset, "FinalData.txt", row.name=FALSE)
