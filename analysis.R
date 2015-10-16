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