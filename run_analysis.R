#run_analysis.R
#4th week project for Gettng and Cleaning Data Coursera class by Ken Meehan
#This program...
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the
#   average of each variable for each activity and each subject.
#

#1. Merges the training and the test sets to create one data set.
rm(list=ls(all=TRUE))    #clear workspace
#read in data, setting column names of X_test and X_train to 2nd column in features.txt
setwd("~/R/GettingandCleaning")
activities <- read.csv("activity_labels.txt", sep="", header=FALSE, col.names=c("activity_code", "activity_desc"))
features <- read.table("features.txt", sep="", header=FALSE)
setwd("test")
X_test <- read.csv("X_test.txt", sep="", header=FALSE, col.names=as.character(features$V2))
y_test <- read.csv("y_test.txt", sep="", header=FALSE, col.names="activity_code")
subject_test <- read.csv("subject_test.txt", sep="", header=FALSE, col.names="subject_number")
setwd("../train")
X_train <- read.csv("X_train.txt", sep="", header=FALSE, col.names=as.character(features$V2))
y_train <- read.csv("y_train.txt", sep="", header=FALSE, col.names="activity_code")
subject_train <- read.csv("subject_train.txt", sep="", header=FALSE, col.names="subject_number")
setwd("..")
test <- cbind(subject_test, y_test, X_test)          #combine all columns of test data
train <- cbind(subject_train, y_train, X_train)     #combine all columns of train data
df <-rbind(test, train)                            #combine all rows of test & train data
remove(features, subject_test, subject_train, test, train, X_test, X_train, y_test, y_train) #cleanup

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
  df <- cbind(df[,1:2], df[, grep("mean|std", colnames(df))])   #first 2 cols & any ending w/ "mean" or "std"

#3. Uses descriptive activity names to name the activities in the data set
df <- merge(activities, df)
df <- df[-grep('activity.code', colnames(df))]     #remove activity.code column

#4. Appropriately labels the data set with descriptive variable names.
#Aren't we already good with this, since we're using the descripive variable names from the raw data?
#I'll save honing this until after at least #5 below.
#Guess at least adding units would be necessary. Where is the original codebook?

#5. From the data set in step 4, creates a second, independent tidy data set with the
#   average of each variable for each activity and each subject.
library(dplyr)
by_subj_act <- df %>% group_by(subject_number, activity_desc)    #group by subject & activity
output <- by_subj_act %>% summarize_each(funs(mean))   #get mean of each variable for each group

write.csv(output, file="output.csv", row.names=FALSE)
