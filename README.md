# CleaningDataProject
Course Project for Getting and Cleaning Data Course

The data was original  from the UCI machine learning site and obtained from the Coursera website and saved in a subdirectory called "UCI HAR Dataset" with the original paths.

The X_train.txt data was combined with the X_test.txt data with the X_train.txt in the initial rows.  Train was put in first in subsequent joins to maintain consistency.

Per the instructions for the project, step 2. Columns were filtered to only mean and std files.  This was determined manually by looking at the variable names in the feature.txt file.  It was assumed that only the labels with mean() and std() were needed as the variables with angle() and meanFreq() were considered to be additional calculations to the mean() and std() values on the same observation.  This resulted in 66 columns.

The features.txt data was used as the variable names (column headers) for the X data.

The Y_train.txt data was combined with the Y_test.txt data with the Y_train.txt in the initial rows.

The Y data was converted to text labels of activities by using the activity.txt data to map the numbered activities to the labels.  The variable was renamed to "Activity" and joined to the X data as the 67th column.

The subject_train.txt data was combined with the subject_test.txt data with the subject_train.txt data in the initial rows.

The variable was renamed to "Subject" and joined to the XY data as the 68th column.

The data in the inertial folders was not used as this data would have been filtered out above.  

The combined X,Y and Subject data then generated into a tidy data data frame that meets the principles of tidy data per "Tidy data and the Assignment" discussion in the forums.  This is subsequently transformed and saved to a tidyData2 after summarizing the tidyData by calculating the means by Subject and Activity and saving the file to a text file with the write.file function with row.names=FALSE.

The tidyData2 file can be read into R with the read.file("tidyData2.txt", headers=TRUE) function. 
