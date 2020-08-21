The `run_analysis.R` script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.
<ol>
<li> <h4>Download the dataset</h4>
Dataset downloaded and extracted under the folder called UCI HAR Dataset</li><br>

<li> <h4>Assign each data to variables</h4>
<i>features</i> <- <i>features.txt</i> : 561 rows, 2 columns<br>
<h5>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.</h5>
<i>activity_labels</i> <- <i>activity_labels.txt</i> : 6 rows, 2 columns<br>
<h5>List of activities performed when the corresponding measurements were taken and its codes (labels)</h5>
<i>subject_test</i> <- <i>test/subject_test.txt</i> : 2947 rows, 1 column<br>
<h5>contains test data of 9/30 volunteer test subjects being observed</h5>
<i>x_test</i> <- <i>test/X_test.txt</i> : 2947 rows, 561 columns<br>
<h5>contains recorded features test data</h5>
<i>y_test</i> <- <i>test/y_test.txt</i> : 2947 rows, 1 columns<br>
<h5>contains test data of activities’code labels</h5>
<i>subject_train</i> <- <i>test/subject_train.txt</i> : 7352 rows, 1 column<br>
<h5>contains train data of 21/30 volunteer subjects being observed</h5>
<i>x_train</i> <- <i>test/X_train.txt</i> : 7352 rows, 561 columns<br>
<h5>contains recorded features train data</h5>
<i>y_train</i> <- <i>test/y_train.txt</i> : 7352 rows, 1 columns<br>
<h5>contains train data of activities’code labels</h5></li>

<li> <h4>Merges the training and the test sets to create one data set</h4>
<i>final_train</i> (7352 rows, 563 columns) is created by merging X_train and y_train using cbind() function and remerging the outcome with activity_labels using merge() function<br>
<i>final_test</i>(2947 rows, 563 column) is created by merging X_test and y_test using cbind() function and remerging the outcome with activity_labels using merge() function<br>
<i>merged_data</i> (10299 rows, 563 column) is created by merging`final_train`and`final_test`using rbind() function<br></li>

<li> <h4>Extracts only the measurements on the mean and standard deviation for each measurement</h4>
<i>TidyData</i> (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement<br>
</li>
<li> <h4>Uses descriptive activity names to name the activities in the data set</h4>
Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable<br></li>

<li> <h4>Appropriately labels the data set with descriptive variable names</h4>
<ul>
<li>All Acc in column’s name replaced by Accelerometer</li>
<li>All Gyro in column’s name replaced by Gyroscope</li>
<li>All BodyBody in column’s name replaced by Body</li>
<li>All Mag in column’s name replaced by Magnitude</li>
<li>All start with character f in column’s name replaced by Frequency</li>
<li>All start with character t in column’s name replaced by Time</li>
</ul>
<li> <h4>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject</h4>
<i>FinalData</i> (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.<br>
</li>
<li> <h4>Export FinalData into FinalData.txt file.</h4>
</li>
</ol>
