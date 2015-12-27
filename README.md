# Getting and Cleaning Data course project

## Description

This repository contains a script developed as the “Getting and Cleaning Data” course project at Coursera. It performs the following transformation against the initial data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

See `CodeBook.md` for more information on the variables, the data and performed transformations.

## How to use

1. Clone the repository.
2. Download the initial data set (see `CodeBook.md` for the URL) and extract the archive to the root directory of the repository.
3. Run the `run_analysis.R` script using R (note that the script requires the `dplyr` package to be installed).
4. After the processing the result dataset will be saved in the `result.txt` file in the root directory of the repository. A small part of the result set is also printed out to the screen as a preview.
