# Check whether the file to be downloaded already exists and if not, download it

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
    unzip(destFile)
    message(paste("" ,destFile, "extracted to", exDirName, "diretory"))
} else {
    message(paste(exDirName, "directory already existed."))   
}

# Load training and test datasets

trainFile <- "UCI HAR Dataset/train/X_train.txt"
trainData <- read.table(trainFile)

testFile <- "UCI HAR Dataset/test/X_test.txt"
testData <- read.table(testFile)

# Load the features variables to filter variabiables for the clean data set

featuresFile <- "UCI HAR Dataset/features.txt"
features <- as.vector(read.table(featuresFile, colClasses = c("numeric", "character"))[,2])

# Return a logical vector. Value is TRUE, when the variable name contains mean() or std() string.

selectedFeatures <- as.vector(sapply(features,function(x) (length(grep("(mean\\(\\)|std\\(\\))",x))>0)))

cleanColNames <- gsub(pattern="-", replacement = "_", features[selectedFeatures])
cleanColNames <- gsub(pattern="\\(\\)", replacement = "", cleanColNames)

# Limit the variables in the train and test datasets using the selectedFeatures vector

trainData <- trainData[selectedFeatures] 
testData <- testData[selectedFeatures] 

# Load and add subject and activity info for training and test datasets

subjectTrainFile <- "UCI HAR Dataset/train/subject_train.txt"
subjectTestFile <- "UCI HAR Dataset/test/subject_test.txt"
activityTrainFile <- "UCI HAR Dataset/train/y_train.txt"
activityTestFile <- "UCI HAR Dataset/test/y_test.txt"

subjectTrain <- as.vector(read.table(subjectTrainFile, colClasses = c("numeric"))[,1])
subjectTest <- as.vector(read.table(subjectTestFile, colClasses = c("numeric"))[,1])
activityTrain <- as.vector(read.table(activityTrainFile, colClasses = c("factor"))[,1])
activityTest <- as.vector(read.table(activityTestFile, colClasses = c("factor"))[,1])

# Add descriptive factor levels for activities. Use mapvalues() function from plyr package

activityLabelsFile <- "UCI HAR Dataset/activity_labels.txt"
activityLabels <- read.table(activityLabelsFile, colClasses = c("numeric", "character"), col.names = c("labNum", "label"))

library(plyr)
activityTrain <- plyr::mapvalues(activityTrain, from = activityLabels$labNum, to = activityLabels$label)
activityTest <- plyr::mapvalues(activityTest, from = activityLabels$labNum, to = activityLabels$label)

# Create full training and test datasets by joining subject and activity info to the variables

trainData <- cbind(subjectTrain,activityTrain,trainData)
testData <- cbind(subjectTest,activityTest,testData)

colnames(trainData) <- c("Subject", "Activity", cleanColNames)
colnames(testData) <- c("Subject", "Activity", cleanColNames)

fullData <- rbind(trainData, testData)

# Preparing a tidy dataset

library(reshape2)

meltFullData <- melt(fullData,id=c("Subject","Activity"),measure.vars=colnames(fullData)[3:ncol(fullData)])
tidyDataSet <- dcast(meltFullData, Subject + Activity~ variable,mean)

# Print tidyDataSet to a file

outputFileName <- "tidy_dataset.txt"

write.table(tidyDataSet, file = outputFileName, row.name=FALSE)
