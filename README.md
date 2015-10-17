# README
Repository created for a main project of 'Getting and Cleaning Data' class at Coursera.

## Overview

### Dataset

Tidy dataset can be found in a file tidy_dataset.txt. It is a result of merging two original datasets (training and test), limiting the number of variables in them and summarizing them by calculating average values of means and standard deviations of features in the raw data set.

### Original data set

Raw data for this exercise has been obtained from UCI Machine Learning Repository. Link to the original data set can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

More information about the original dataset can be found in a [CodeBook.md](CodeBook.md) file.

### Project files

1. Tidy dataset: [tidy_dataset.txt](tidy_dataset.txt)
2. Script generating tidy dataset: [run_analysis.txt](run_analysis.txt)
3. Readme file: [README.md](README.md)
4. Codebook: [CodeBook.md](CodeBook.md)

## run_analysis.R script overview.

run_analysis.R script:

1. Downloads the raw dataset (if not already downloaded)
2. Unsips the raw dataset (if not already unzipped)
3. Loads the [training](UCI HAR Dataset/train/X_train.txt) and [test](UCI HAR Dataset/test/X_test.txt) datasets to workspace
4. Loads the [feature list](UCI HAR Dataset/features.txt) to the workspace
5. Creates a logical vector with value TRUE, where feature name contains string 'mean()' or 'std()'
6. Limits the training and dest datasets to only those variables of which position matches the position of TRUE values in the logical vector from point 5.
7. Loads to the workspace the subject and acticity variables from [subject_train.txt](), [subject_test.txt](), [y_train.txt]() and [y_test.txt]() files.
8. Loads the descriptive activity labels from file [activity_labels.txt](UCI HAR Dataset/activity_labels.txt)
9. Recodes the activity variables loaded in point 7 to descriptive labels (using *mapvalues* function from *plyr* package).
10. Adds subject and activity data to training and test datasets.
11. Combines training and test datasets into full dataset.
12. Metls the full dataset using *melt* function from *reshape2* package.
13. Summarizes non-id variables by calculating their mean across subjects and activities using *dcast* function (*reshape2*) library.
14. Writes the tidy dataset to the [tidy_dataset.txt](tidy_dataset.txt) file.


