#This is the required script
#First and foremost we should import activity labels and features TXT file to our environment, naming significant columns with descriptive labels

activity_labels <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("ActivityLabel","ActivityName"))
features <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/features.txt", header = FALSE)

#Then import our training data set, vectors of values from the X_train file and the correspondant subjects to each vector from y_train file, naming significant columns with descriptive labels

subject_train <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = c("Subject"))
X_train <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features$V2)
y_train <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = c("ActivityLabel"))

#We merge then the data frame that resulted from coersing X_train,y_train to link each vector of values with the corresponding activity  

final_train <-merge(
  cbind(subject_train,y_train,X_train)
  ,activity_labels,by = "ActivityLabel")

#We follow the same previous steps for the test dataset

subject_test <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("Subject"))
X_test <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features$V2)
y_test <- read.table("C:/Users/Fatima Zahra Ayad/Documents/UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = c("ActivityLabel"))
final_test <-merge(
  cbind(subject_test,y_test,X_test)
  ,activity_labels,by = "ActivityLabel")

#The final dataset is obtained from rows binding the training and the test datasets  

final <- rbind(final_train,final_test)[,c(2,564,3:563)]

#We adjust the final data set column names to respect the required conditions of those of a tidy dataset

names(final) <- gsub(".","",tolower(names(final)), fixed = TRUE)

#We select the wanted measurements 

wanted_measurements <- grep("(.*)mean|(.*)std",names(final))

#Then we subset our final data set according to the given list that contains only the mean and standard deviation for each measurement.

final_1 <-final[,c(1,2,wanted_measurements)]

#Finally, we create a second, independent tidy data set with the average of each variable for each activity and each subject.
require(dplyr)
require(tidyr)
grouped_dataset <-
  spread(
    summarize(
      group_by(
        gather(tbl_df(final_1), key = "var",value = "value",-(subject:activityname))
        ,subject,activityname,var),mean = mean(value))
          ,var,mean)

