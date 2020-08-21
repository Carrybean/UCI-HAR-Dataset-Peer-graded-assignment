# UCI-HAR-Dataset-Peer-graded-assignment
--- 
#### This repository is about putting in practice getting and cleaning data using R methods on the UCI HAR Dataset.

## About the dataset:

> Human Activity Recognition (HAR) database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

> ##### The obtained dataset which consists of 10299 instances has been randomly partitioned into two sets, where 70% (<i>7352 entries</i>) of the volunteers was selected for generating the training data and 30% (<i>2947 entries</i>) the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## About features:
<ol>
  <li>Feature selection :</li><br>
        The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals<i>tAcc-XYZ</i> and<i>tGyro-XYZ</i>. These time domain signals (prefix 't' to denote <b>time</b>) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals(<i>tBodyAcc-XYZ</i> and<i>tGravityAcc-XYZ</i>) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
        Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (<i>tBodyAccJerk-XYZ</i> and<i>tBodyGyroJerk-XYZ</i>). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (<i>tBodyAccMag</i>,<i>tGravityAccMag</i>,<i>tBodyAccJerkMag</i>, <i>tBodyGyroMag</i>, <i>tBodyGyroJerkMag</i>). 
        Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing<i>fBodyAcc-XYZ</i>, <i>fBodyAccJerk-XYZ</i>, <i>fBodyGyro-XYZ</i>, <i>fBodyAccJerkMag</i>, <i>fBodyGyroMag</i>, <i>fBodyGyroJerkMag</i>.<br>(Note the 'f' to indicate frequency domain signals).
        Counting, this makes up a total of 17 measurements calculated originally from two raw 3-axial linear acceleration and 3-axial angular velocity signals : tAcc-XYZ and tGyro-XYZ.
  <table style="width:80%">
  <tr>
    <th>Feature name</th>
    </tr>
    <tr><td>tBodyAcc-XYZ</td></tr>
    <tr><td>tGravityAcc-XYZ</td></tr>
    <tr><td>tBodyAccJerk-XYZ</td></tr>
    <tr><td>tBodyGyro-XYZ</td></tr>
    <tr><td>tBodyGyroJerk-XYZ</td></tr>
    <tr><td>tBodyAccMag</td></tr>
    <tr><td>tGravityAccMag</td></tr>
    <tr><td>tBodyAccJerkMag</td></tr>
    <tr><td>tBodyGyroMag</td></tr>
    <tr><td>tBodyGyroJerkMag</td></tr>
    <tr><td>fBodyAcc-XYZ</td></tr>
    <tr><td>fBodyAccJerk-XYZ</td></tr>
    <tr><td>fBodyGyro-XYZ</td></tr>
    <tr><td>fBodyAccMag</td></tr>
    <tr><td>fBodyAccJerkMag</td></tr>
    <tr><td>fBodyGyroMag</td></tr>
    <tr><td>fBodyGyroJerkMag</td></tr>
  </table>
   
 <li>Describing features :</li><br>
        The HAR dataset is described by 561 features estimated from the previous 17 measurements,either by calculating their mean, standard deviation,median absolute deviation and many others functions presented in teh tables that follows:
        <table style="width:100%">
  <tr>
    <th>Function name</th>
    <th>Explication</th>
  </tr>
  <tr>
    <td>mean()</td>
    <td>Mean value</td>
  </tr>
  <tr>
    <td>std()</td>
    <td>Standard deviation</td>
  </tr>
  <tr>
    <td>mad()</td>
    <td>Median absolute deviation</td>
  </tr>
  <tr>
    <td>max()</td>
    <td>Largest value in array</td>
  </tr>
  <tr>
    <td>min()</td>
    <td>Smallest value in array</td>
  </tr>
  <tr>
    <td>sma()</td>
    <td>Signal magnitude area</td>
  </tr>
  <tr>
    <td>energy()</td>
    <td>Energy measure. Sum of the squares divided by the number of values</td>
  </tr>
  <tr>
    <td>iqr()</td>
    <td>Interquartile range</td>
  </tr>
  <tr>
    <td>entropy()</td>
    <td>Signal entropy</td>
  </tr>
  <tr>
    <td>arCoeff()</td>
    <td>Autorregresion coefficients with Burg order equal to 4</td>
  </tr>
  <tr>
    <td>correlation()</td>
    <td>correlation coefficient between two signals</td>
  </tr>
  <tr>
    <td>cmaxInds()</td>
    <td>index of the frequency component with largest magnitude</td>
  </tr>
  <tr>
    <td>meanFreq()</td>
    <td>Weighted average of the frequency components to obtain a mean frequency</td>
  </tr>
  <tr>
    <td>skewness()</td>
    <td>skewness of the frequency domain signal</td>
  </tr>
  <tr>
    <td>kurtosis()</td>
    <td>kurtosis of the frequency domain signal</td>
  </tr>
  <tr>
    <td>bandsEnergy()</td>
    <td>Energy of a frequency interval within the 64 bins of the FFT of each window</td>
  </tr>
  <tr>
    <td>angle()</td>
    <td>Angle between to vectors</td>
  </tr>
  </table>
  Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
<table style="width:80%">
  <tr>
    <th>Feature name</th>
  </tr>
  <tr>
    <td>gravityMean</td>
  </tr>
  <tr>
    <td>tBodyAccMean</td>
  </tr>
  <tr>
    <td>tBodyAccJerkMean</td>
  </tr>
  <tr>
    <td>tBodyGyroMean</td>
  </tr>
  <tr>
    <td>tBodyGyroJerkMean</td>
  </tr>



 

