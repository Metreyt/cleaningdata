# Description of variables and data transformations

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The dataset includes the following files:
-----------------------------------------

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

For each record it is provided:
-------------------------------

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.


Description of Variables used in Script and Corresponding Data Transformations:
------------------------------------------------------------------------------

- test dataset is read from test/X_test.txt in data frame __testDataset__ using
  read.table api

- train dataset is read from train/X_test.txt in data frame __trainDataset__
  using read.table api

- Column names are not present in the dataset and needs to be read separately
  and dataset needs to be updated to make it more readable. Column names are
  present in features.txt. They are read as data frame in __features__ variable,
  and are used as column names for testDataset and trainDataset.

- We also insert two more columns, subject_id and activity to make the dataset
  more descriptive. subject_id is present in test/test_subject.txt and
  train/train_subject.txt. Activity ids are present in test/y_test.txt and
  train/y_train.txt. Activity labels are present in activity_labels.txt. Since
  these two columns are inserted in the base dataset, all the resultant datasets
  have these two attributes present.

- Both test and train datasets also have some duplicate columns, for e.g.
  "fBodyAcc-bandsEnergy()-1,16" which has three occurences. We only take the
  first column identified by unique(colname(dataset)) in our merged dataset. We
  use the merge api to merge the datasets, and we use the default behavior,
  which is to merge using _all common column names_. The resulting dataset will
  have one row each from test dataset and training dataset.

- To extract only the measurements on the mean and standard deviation for each
  measurement, we extract only the columns that have mean() and std() in their
  column names, since that is how the data is stored. We also extract student_id
  and activity columns so that the resulting dataset is descriptive.

- To tidy up the data, we first create a molten dataset by using student_id and
  activity as the ids, and the remaining columns as variables, and then dcast
  the dataset using the formula __subject_id + activity ~ variable__, and then
  apply __mean__ aggregation function on the resulting observations of the
  variables. 

- Interesting variables are stored as global variables, so after the script is
  run they can be accessed on the R console. The merged dataset is stored in
  __mergedDataset__, the dataset with only mean and standard deviation
  observations is stored in __mean\_std\_dataset__, and the final resulting tidy
  dataset is stored in __finalDataset__.

