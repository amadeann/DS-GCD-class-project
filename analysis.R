# check if the directory for class 3 exists and create it if it doesnt

#subDir <- "class3"
#if (!file.exists(subDir)){
#    dir.create(subDir)
#    message(paste(subdir, "directory created"))
#} else {
#    message(paste(subDir, "directory already existed. No directory created."))
#}

# Check whether the file to be donwloaded already exists and if not, download it

destFile <- "samsung.zip"

if(!file.exists(destFile)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = destFile, method = "wget")
    message(paste(destFile, "file downloaded"))
} else {
    message(paste(destFile, "file already existed"))   
}

# check whether the file was already extracted. If not, extract it.

exDirName <- "UCI HAR Dataset"

if(!file.exists(exDirName)) {
    unzip(destFile, exdir = subDir)
    message(paste("" ,destFile, "extracted to", exDirName, "diretory"))
} else {
    message(paste(exDirName, "directory already existed."))   
}

# Load training and test datasets

trainFile <- "UCI HAR Dataset/train/X_train.txt"
trainData <- read.table(trainFile, nrows = 6)

testFile <- "UCI HAR Dataset/test/X_test.txt"
testData <- read.table(testFile, nrows = 6)

# Load the features variables to filter variabiables for the clean data set

featuresFile <- "UCI HAR Dataset/features.txt"
features <- as.vector(read.table(featuresFile, colClasses = c("numeric", "character"))[,2])

# Return a logical vector. Value is TRUE, when the variable name contains mean() or std() string.

selectedFeatures <- as.vector(sapply(features,function(x) (length(grep("(mean\\(\\)|std\\(\\))",x))>0)))

cleanColNames <- gsub(pattern="-", replacement = "_", features[selectedFeatures])
cleanColNames <- gsub(pattern="\\(\\)", replacement = "", cleanColNames)

# Limit the variables in the train and test datasets

trainData <- trainData[selectedFeatures] 
testData <- testData[selectedFeatures] 

colnames(trainData) <- cleanColNames
colnames(testData) <- cleanColNames

# Load and add subject and activity info for training and test datasets

subjectTrainFile <- "UCI HAR Dataset/train/subject_train.txt"
subjectTestFile <- "UCI HAR Dataset/test/subject_test.txt"
activityTrainFile <- "UCI HAR Dataset/train/y_train.txt"
activityTestFile <- "UCI HAR Dataset/test/y_test.txt"

subjectTrain <- as.vector(read.table(subjectTrainFile, colClasses = c("factor")))
subjectTest <- as.vector(read.table(subjectTestFile, colClasses = c("factor")))
activityTrain <- as.vector(read.table(activityTrainFile, colClasses = c("factor")))
activityTest <- as.vector(read.table(activityTestFile, colClasses = c("factor")))

# Add descriptive factor levels for activities. Use mapvalues() function from plyr package

activityLabelsFile <- "UCI HAR Dataset/activity_labels.txt"
activityLabels <- read.table(activityLabelsFile, colClasses = c("numeric", "character"), col.names = c("labNum", "label"))
library(plyr)
plyr::mapvalues(x, from = c("beta", "gamma"), to = c("two", "three"))

