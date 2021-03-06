library(dplyr)

# Function that creates a path of the description file
# (e.g., feature list, activity labels)
desc.file.path <- function(name) {
  return(sprintf("UCI HAR Dataset/%s.txt", name))
}

# Function that creates a path of the file belonging to a data set
# (train or test)
dataset.file.path <- function(dataset, name) {
  return(sprintf("UCI HAR Dataset/%s/%s_%s.txt", dataset, name, dataset))
}

# Constants
features <- read.table(desc.file.path('features'), stringsAsFactors=FALSE)[,2]
activity.labels <- read.table(desc.file.path('activity_labels'))[,2]
activities.to.select <- grep('(mean|std)\\(\\)', features)

# Function that loads the specified dataset and performs the operations described
# in steps 2-4 of the task
load.and.prepare.dataset <- function(dataset) {
  # Loading the data
  subjects <- read.table(dataset.file.path(dataset, 'subject'))
  data <- read.table(dataset.file.path(dataset, 'X'), col.names = features)
  activities <- read.table(dataset.file.path(dataset, 'y'))
  # Processing of the data according steps 2-4
  activities <- lapply(activities, function(idx) activity.labels[idx])
  data <- cbind(activities, subjects, data[, activities.to.select])
  colnames(data)[1:2] = c('activity', 'subject')
  return(data)
}


### Main program ###

# Combine data from two datasets (step 1 of the task)
data <- rbind(load.and.prepare.dataset('train'), load.and.prepare.dataset('test'))

# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject (step 5 of the task)
result <- summarize_each(group_by(data, activity, subject), funs(mean))

# Output the result to the file and to the screen
write.table(result, file = 'result.txt', row.name = FALSE)
print(result)
