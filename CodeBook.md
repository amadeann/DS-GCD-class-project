# Codebook

---

title: "Class Project - Getting and Cleaning Data"
author: "Amadeusz Annissimo"
date: "October 17, 2015"

---

## Project Description

Project has been undertaken as a part of Getting and Cleaning Data class at Coursera. The goal of the project was to deliver:

1. tidy dataset
2. script used for gathering the raw data and performing the data cleanup
3. README.md file
4. code book. 

##Study design and data processing

###Collection of the raw data

Raw data for this exercise has been obtained from UCI Machine Learning Repository. Link to the original data set can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Dataset is a result of a study on *Human Activity Recognition Using Smartphones* performed by:
1. Smartlab - Non-Linear Complex Systems Laboratory of Universita degli Studi di Genova 
2. CETpD - Technical Research Centre for Dependency Care and Autonomous Living of Universitat Politecnica de Catalunya. 

Description of the stury itself can be found on the UCI website linked above.

###Notes on the original (raw) data 

Original data set consisted of the following files:

- 'README.txt'
- 'features_info.txt': information about the variables used on the feature vector.
- 'features.txt': list of all features.
- 'activity_labels.txt': links the class labels with their activity name.
- 'train/X_train.txt': training set.
- 'train/y_train.txt': training labels.
- 'test/X_test.txt': test set.
- 'test/y_test.txt': test labels.

Besides the files listed above, the original data set included other files, but they were of no interest for the purpose of this exercise.
Their list can be found in the README.txt file of the original dataset.

##Creating the tidy datafile

###Guide to create the tidy_dataset.txt file
In order to obtain the tidy dataset, please run the [run_analysis.R](run_analysis.R) file. Code in the file handles the download of the file from the UCI Machine Learning Repository website and does all the necessary cleanups and aggregations.

###Cleaning of the data

Project instructions called for extracting the measurments for on the mean and standard deviation for each measurment. 
Consequently, only the variables listed in the 'features.txt' file of the original data set which contained a string 'mean()' or 'std()' have been included in the tidy dataset. Variables containing the string 'meanFreq()' were not included as they represented the mean of frequencies and not signal means. Variables averaging the signals in a signal window sample were also excluded from the tidy dataset as they had no corresponding standard deviation values in the raw dataset.

Detailed description of the cleanup process can be found in the [README.md](README.md) file

##Description of the variables in the tidy_data.txt file

Tidy dataset contains 180 observations with and 68 variables. 

First 2 variables idenfity a single observations:

Subject - number of the study subject (a person, in total there were 30 subjects). Variable is of class "numeric".
Activity - a descriptive label of the activity performed by the subject (walking, walking upstairs, walking downstairs, sitting, standing, laying). Variable is of class "label".

Another 66 variables represent the mean value of mean and standard deviation measurments in the original data set. All of the 66 variables are of the numeric type.

Naming convenction of the variables follows the features naming convention from the original data set. Full description can be found [here](/UCI HAR Dataset/features_info.txt). To summarize:

- first letter, t or f indicate the time or frequency domain signals repectively.
- Strings 'BodyAcc' and 'BodyBodyAcc' indicate that the variable was measured as body acceleration signals using accelerometer
- String 'GravityAcc' indicates that the variable was measured as gravity acceleration signals using accelerometer
- Strings 'BodyGyro' and BodyBody indicate that the variable was measured as body angular velocity signals using gyroscope
- String 'Jerk' indicates the jerk signals
- String 'Mag' indicates the magnitude of the signal
- Strings 'X', 'Y' and 'Z' each represent the measurment value for each dimension (X,Y,Z). 

Full list of variables in the tidy dataset:

- Subject
- Activity
- tBodyAcc_mean_X
- tBodyAcc_mean_Y
- tBodyAcc_mean_Z
- tBodyAcc_std_X
- tBodyAcc_std_Y
- tBodyAcc_std_Z
- tGravityAcc_mean_X
- tGravityAcc_mean_Y
- tGravityAcc_mean_Z
- tGravityAcc_std_X
- tGravityAcc_std_Y
- tGravityAcc_std_Z
- tBodyAccJerk_mean_X
- tBodyAccJerk_mean_Y
- tBodyAccJerk_mean_Z
- tBodyAccJerk_std_X
- tBodyAccJerk_std_Y
- tBodyAccJerk_std_Z
- tBodyGyro_mean_X
- tBodyGyro_mean_Y
- tBodyGyro_mean_Z
- tBodyGyro_std_X
- tBodyGyro_std_Y
- tBodyGyro_std_Z
- tBodyGyroJerk_mean_X
- tBodyGyroJerk_mean_Y
- tBodyGyroJerk_mean_Z
- tBodyGyroJerk_std_X
- tBodyGyroJerk_std_Y
- tBodyGyroJerk_std_Z
- tBodyAccMag_mean
- tBodyAccMag_std
- tGravityAccMag_mean
- tGravityAccMag_std
- tBodyAccJerkMag_mean
- tBodyAccJerkMag_std
- tBodyGyroMag_mean
- tBodyGyroMag_std
- tBodyGyroJerkMag_mean
- tBodyGyroJerkMag_std
- fBodyAcc_mean_X
- fBodyAcc_mean_Y
- fBodyAcc_mean_Z
- fBodyAcc_std_X
- fBodyAcc_std_Y
- fBodyAcc_std_Z
- fBodyAccJerk_mean_X
- fBodyAccJerk_mean_Y
- fBodyAccJerk_mean_Z
- fBodyAccJerk_std_X
- fBodyAccJerk_std_Y
- fBodyAccJerk_std_Z
- fBodyGyro_mean_X
- fBodyGyro_mean_Y
- fBodyGyro_mean_Z
- fBodyGyro_std_X
- fBodyGyro_std_Y
- fBodyGyro_std_Z
- fBodyAccMag_mean
- fBodyAccMag_std
- fBodyBodyAccJerkMag_mean
- fBodyBodyAccJerkMag_std
- fBodyBodyGyroMag_mean
- fBodyBodyGyroMag_std
- fBodyBodyGyroJerkMag_mean
- fBodyBodyGyroJerkMag_std


##Sources

1. Structure of this codebook is based on the template from Joris Schut. Link [here](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41#file-gistfile1-rmd).
