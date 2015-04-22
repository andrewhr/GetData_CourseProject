# install and load required libraries
if (!require("reshape2")) {
  install.packages("reshape2") 
}
library(reshape2)

# download and unzip data for analysis
if (!file.exists("./data/UCI HAR Dataset/")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "./data/dataset.zip",
                method = "libcurl")
  unzip("./data/dataset.zip", exdir = "./data")
}

# load up dataset information about column names and activities
HAR.features <- read.table("./data/UCI HAR Dataset/features.txt")[, 2]
HAR.activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[, 2]
HAR.desired  <- grepl("mean|std", HAR.features)

# generic function to load up the dataset files and compose a single
# data frame. The parameters are the paths to the files of each
# component: X, Y and Subject Ids.
HAR.read <- function (x, y, subject) {
  dataset.x <- read.table(x, col.names = HAR.features)
  dataset.y <- read.table(y, col.names = c("activity"), colClasses = c("factor"))
  dataset.subject <- read.table(subject, col.names = c("subject"))
  levels(dataset.y$activity) <- HAR.activity
  cbind(dataset.subject, dataset.y, dataset.x[, HAR.desired])
}

# load and combine train and test datasets
train  <- HAR.read(x = "./data/UCI HAR Dataset/train/X_train.txt",
                   y = "./data/UCI HAR Dataset/train/y_train.txt",
                   subject = "./data/UCI HAR Dataset/train/subject_train.txt")
test   <- HAR.read(x = "./data/UCI HAR Dataset/test/X_test.txt",
                   y = "./data/UCI HAR Dataset/test/y_test.txt",
                  subject = "./data/UCI HAR Dataset/test/subject_test.txt")
merged <- rbind(train, test)

# create tidy dataset of average values per subject/activity and dump
# to a text file
tidy <- dcast(melt(merged, id = c("subject", "activity")),
              subject + activity ~ variable,
              mean)
write.table(tidy, file = "./tidy.txt", row.names = FALSE)