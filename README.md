# Getting and Cleaning Data

This repo contains the run\_analysis.R script, which is part of the Peer Review
Programming Assignment for coursera course __Getting and Cleaning Data__ by
_Prof. Jeff Leak_. The script takes single input argument, "working directory".
The working directory is where the data files are present. So for e.g.  if the
data files are located at

Murtuzas-Mac-mini:UCI HAR Dataset murtuza$ pwd

/Users/murtuza/coursera/gettingdata/project/UCI HAR Dataset

Murtuzas-Mac-mini:UCI HAR Dataset murtuza$ ls

README.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;features.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test  
activity\_labels.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;features\_info.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;run\_analysis.R&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;train


The script should be called as 
run_analysis("/Users/murtuza/coursera/gettingdata/project/UCI\ HAR\ Dataset")

Alternatively, from the R console one can also do
setwd("/Users/murtuza/coursera/gettingdata/project/UCI\ HAR\ Dataset")
run_analysis(getwd())

The output of the script is the cleaned up dataset as required by the
assignment. The script returns the data.frame object of the tidy dataset, so if
you don't want your console to be filled with data after the script is called,
you can store the result in a variable, as shown below

tidyDataset <- run_analysis("/Users/murtuza/coursera/gettingdata/project/UCI\ HAR\ Dataset")

Now tidyDataset has the cleaned up data.frame object.
