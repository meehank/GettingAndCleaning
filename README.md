# Getting-and-Cleaning-Data-Course-Project
This repository is to satisfy the requirements for the Coursera Getting and Cleaning Data course project.

The project that generated the data to be analyzed:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data were downloaded from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Two datasets, one for testing and one for training, were merged and cleaned.
Thirty subjects engaged in six different activities while wearing smartphones that recorded hundereds of attributes of their motions.
The activities were: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
For a specified set of motion attributes (those with "mean" or "std" in their variable names--79 of them in total),
the average was calculated for each combination of subject and activities.

The resultant datafile holds 180 records (30 subjects x 6 activities).
Each record lists the number of the subject (from 1 to 30), the activity name, and the average of the 79 motion attributes.


Invaluable hints and clarifications were obtained here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip