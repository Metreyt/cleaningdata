run_analysis <- function(wd) {
    setwd(wd)
    library(data.table)
    library(reshape2)
    
    # Read the features
    features <- read.table("features.txt")
    
    # Read activity labels
    activity <- read.table("activity_labels.txt", sep="", header=FALSE)
    activityLabels <- as.character(activity$V2)
    
    # Read activity labels for test dataset
    testActivityLabels <- read.table("test/y_test.txt", sep="", header=FALSE)
    
    # Add description for activity labels of test dataset
    testActivityLabels <- factor(testActivityLabels$V1, labels=activityLabels)
    
    # Read subject ids for test dataset
    testSubjects <- read.table("test/subject_test.txt", sep="", header=FALSE)
    
    # Read test dataset
    testDataset <- read.table("test/X_test.txt", sep="", header=FALSE)
    
    # Read activity labels for training dataset
    trainActivityLabels <- read.table("train/y_train.txt", sep="", header=FALSE)
    
    # Add description for activity labels of training dataset
    trainActivityLabels <- factor(trainActivityLabels$V1, labels=activityLabels)
    
    # Read subject ids for training dataset
    trainSubjects <- read.table("train/subject_train.txt", sep="", header=FALSE)
    
    # Read training dataset
    trainDataset <- read.table("train/X_train.txt", sep="", header=FALSE)
    
    # 1. Merge the training and test datasets to create one dataset
    # To do that first let's give meaningful column names to our dataset
    # The columns are nothing but features
    names(testDataset) <- features$V2
    names(trainDataset) <- features$V2
    
    # Add activity column so that dataset becomes more descriptive
    testDataset <- cbind(activity = testActivityLabels, testDataset)
    trainDataset <- cbind(activity = trainActivityLabels, trainDataset)

    # Now add subject_id column to our dataset
    testDataset <- cbind(subject_id = as.vector(testSubjects$V1), testDataset)
    trainDataset <- cbind(subject_id = as.vector(trainSubjects$V1), trainDataset)

    # Merge the datasets using the default setting of using all the common columns
    mergedDataset <<- merge(testDataset[,unique(colnames(testDataset))], trainDataset[,unique(colnames(trainDataset))],all=TRUE)

    # Extract the columns that have only mean and std deviation observations
    # Keep subject_id and activity columns so that the extracted dataset is descriptive
    mean_std_dataset <<- mergedDataset[,grepl("subject_id|activity|mean\\(\\)|std\\(\\)",colnames(mergedDataset), ignore.case=FALSE)]

    # Create molten dataset as a first step for creating the tidy dataset
    moltenDataset <- melt(mergedDataset,id=c("subject_id","activity"),measure.vars=colnames(mergedDataset)[-(1:2)])

    # Create tidy dataset from the molten dataset
    finalDataset <<- dcast(moltenDataset, subject_id + activity ~ variable, mean)
    finalDataset
}
