# set Working directory
setwd("~/GitHub/CleaningDataProject")

library(stringr)
library(dplyr)

# read variable names for x test and training sets
name_list <- read.table("UCI HAR Dataset/features.txt")

# load x test and training sets

x_train.df <- read.table("UCI HAR Dataset/train/X_train.txt")
names(x_train.df) <- name_list[,2]

x_test.df <- read.table("UCI HAR Dataset/test/X_test.txt")
names(x_test.df) <- name_list[,2]

# combine training and test sets (training first)
x_all.df <- rbind(x_train.df,x_test.df)

# determined manually by looking at the name_list that the following columns should be kept
# based upon meaning step 2
# 1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166
# 201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425
# 426,427,428,429,503,504,516,517,529,530,542,543

# did not include meanFreq columns 295 an 296 373-375 as this was considered not a mean of the 
# of the sensor measurement, but an analysis result


columns_keep <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,
                  161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,
                  268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,
                  503,504,516,517,529,530,542,543)

x_all_filtered.df <- x_all.df[,columns_keep]


# filter name list
name_list_filtered <- name_list[columns_keep,]
name_list_filtered$V2 <- gsub("[[:punct:]]", " ", name_list_filtered$V2)
name_list_filtered$V2 <- gsub("mean","Mean", name_list_filtered$V2)
name_list_filtered$V2 <- gsub("std", "StDev", name_list_filtered$V2)
name_list_filtered$V2 <- str_trim(name_list_filtered$V2)
name_list_filtered$V2 <- gsub(" +","\\.",name_list_filtered$V2)

names(x_all_filtered.df) <- name_list_filtered[,2]


# remove unneeded objects
rm(name_list)
rm(x_train.df)
rm(x_test.df)
rm(x_all.df)
rm(columns_keep)

y_test.df <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train.df <- read.table("UCI HAR Dataset/train/y_train.txt")

y_all.df = rbind(y_train.df, y_test.df)
rm(y_train.df)
rm(y_test.df)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")


y_all.df$Activity <- "blank"
for (i in seq(1:6)) {
  y_all.df$Activity[y_all.df$V1==i] <- as.character(activity_labels[i,"V2"])
}

y_all_labeled.df <- data.frame(y_all.df[,2])
names(y_all_labeled.df) <- "Activity"

xy_all.df <- cbind(x_all_filtered.df, y_all_labeled.df)

subject_test.df <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train.df <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_all.df <- rbind(subject_train.df, subject_test.df)
names(subject_all.df) <- "Subject"
rm(subject_train.df,subject_test.df)

tidyData <- cbind(xy_all.df, subject_all.df)

rm(activity_labels)
rm(name_list_filtered)
rm(xy_all.df)
rm(y_all.df)
rm(subject_all.df)
rm(i)
rm(y_all_labeled.df)
rm(x_all_filtered.df)

tidyData2 <- tidyData %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

write.table(tidyData2, "tidyData2.txt", row.name=FALSE)

