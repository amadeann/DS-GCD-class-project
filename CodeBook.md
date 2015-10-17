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

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data

Project instructions called for extracting the measurments for on the mean and standard deviation for each measurment. 
Consequently, only the variables listed in the 'features.txt' file of the original data set which contained a string 'mean()' or 'std()' have been included in the tidy dataset. Variables containing the string 'meanFreq()' were not included as they represented the mean of frequencies and not signal means. Variables averaging the signals in a signal window sample were also excluded from the tidy dataset as they had no corresponding standard deviation values in the raw dataset.

Detailed description of the cleanup process can be found in the [README.md](README.md) file

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources

1. Structure of this codebook is based on the template from Joris Schut. Link [here](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41#file-gistfile1-rmd).

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
