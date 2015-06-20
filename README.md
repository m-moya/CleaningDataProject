# CleaningDataProject
Course Project for Getting and Cleaning Data Course


The X_train.txt data was combined with the X_test.txt data with the X_train.txt in the initial rows.  Train was put in first in subsequent joins to maintain consistency.

Per the instructions for the project, step 2. Columns were filtered to only mean and std files.  This was determined manually by looking at the variable names in the feature.txt file.  It was assumed that only the labels with mean() and std() were needed as the variables with angle() and meanFreq() were considered to be additional calculations to the mean() and std() values on the same observation.  This resulted in 66 columns.

The features.txt data was used as the variable names (column headers) for the X data.

The Y_train.txt data was combined with the Y_test.txt data with the Y_train.txt in the initial rows.

The Y data was converted to text labels of activities by using the activity.txt data to map the numbered activities to the labels.  The variable was renamed to "Activity" and joined to the X data as the 67th column.

The subject_train.txt data was combined with the subject_test.txt data with the subject_train.txt data in the initial rows.

The variable was renamed to "Subject" and joined to the XY data as the 68th column.

The data in the inertial folders was not used as this data would have been filtered out above.  
