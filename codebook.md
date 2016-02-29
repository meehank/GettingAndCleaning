Getting-and-Cleaning-Data-Course-Project Codebook


This repository is to satisfy the requirements for the Coursera Getting and Cleaning Data course project.
The project that generated the data to be analyzed:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data were downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
run_analysis.R takes these steps to prepare the data:
1.	Creates "activities" dataframe by using read.csv with sep="", header=FALSE,
		and col.names=c(("activity_code", "activity_desc").
		activities has 6 rows and two columns.
2.	Creates "features" dataframe by using read.csv with sep="" and header=FALSE.
		features has 561 rows and 2 columns
3.	From "test" directory, uses read.csv with sep="" and header=FALSE to create
		X_test dataframe with col.names=as.character(features$V2)   2947 records by 561 fields
		y_test dataframe with col.names="activity_code"             2947 records by 1 field
		subject_test dataframe with col.names=subject_number        2947 records by 1 field
4.	From "train" directory, uses read.csv with sep="" and header=FALSE to create
		X_train dataframe with col.names=as.character(features$V2)   7352 records by 561 fields
		y_train dataframe with col.names="activity_code"             7352 records by 1 field
		subject_train dataframe with col.names=subject_number        7352 records by 1 field
5.	Merges the test and train dataframes into a single dataframe "df" by
		using cbind to make "test" dataframe from subject_test, y_test, X_test
		using cbind to make "train" dataframe from subject_train, y_train, X_train
		using rbind to make "df" dataframe from test and train
6.  Selects only the features with either "mean" or "std" in their names	
		using cbind of fisrt two columns of df (activity_code and subject_number)
		with df[, grep("mean|std", colnames(df))]
7.	Substitutes activity_desc for activity_code by merging activities dataframe with df
		and then removing the activity_code column via df <- df[-grep('activity.code', colnames(df))]
8.  Using the dplyr library and piping, groups df by subject_number and activity_desc
		and then calculates means for all the feature variables using summarize_each
run_analysis.R does nothing to clean up column names, since its author felt they were already adequate.		