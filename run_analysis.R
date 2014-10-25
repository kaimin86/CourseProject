#give instructions for taking out the relevant files and put in
#wd for neater file path

#START OF STEP 1#

#read each of the training files in as dataframe
subject_train <- read.table("./subject_train.txt")
y_train <- read.table("./y_train.txt")
X_train <- read.table("./X_train.txt")

#column bind to form full training data set
data_train <- cbind(subject_train,y_train,X_train)

#read each of the test files in as dataframe
subject_test <- read.table("./subject_test.txt")
y_test <- read.table("./y_test.txt")
X_test <- read.table("./X_test.txt")

#column bind to form full test data set 
data_test <- cbind(subject_test,y_test,X_test)

#row bind to form full data set
data_full <- rbind(data_train, data_test)

#This part is done to create a character vector of col names

#extract features.txt which contains col names
features <- read.table("./features.txt")
#remove the first col which just gives number 1 to 561
#what you will get is a vector of feature names
features2 <- features[,2]
#convert this from factor variable to string
features3 <- as.character(features2)
#Add subject ID and activity ID to complete vector of col names
cnames <- c("SubjectID","ActivityID",features3)

#label the columns of the dataframe to obtain complete data set
colnames(data_full) <- cnames
#note that this actually coincides with STEP 4

#END OF STEP 1#

#START OF STEP 2#

#use grep to find out which colums contain "mean" and "std"
#grep used as it can isolate substrings within a word
#grab is a numeric vector that corresponds to which columns
#we want to pull out
#columns 1 and 2 are pulled as they correspond to Subject ID
#and activity ID
grab <- c(1,2, grep("mean",cnames),grep("std", cnames))
#grab is sorted in ascending order to get grab 2
#this is so we get columns in the order we want
grab2 <- sort(grab)

#use vector grab2 to subset the out the columns we want
Tidydata <- data_full[,grab2]

#END OF STEP 2#

#START OF STEP 3#

#Substitute the numeric values in the "Activity ID"
#column with the relevant activity name
#Note that "Activity ID" is the 2nd column
Tidydata[Tidydata$"ActivityID" == 1, 2] <- "WALKING"
Tidydata[Tidydata$"ActivityID" == 2, 2] <- "WALKING_UPSTAIRS"
Tidydata[Tidydata$"ActivityID" == 3, 2] <- "WALKING_DOWNSTAIRS"
Tidydata[Tidydata$"ActivityID" == 4, 2] <- "SITTING"
Tidydata[Tidydata$"ActivityID" == 5, 2] <- "STANDING"
Tidydata[Tidydata$"ActivityID" == 6, 2] <- "LAYING"

#END OF STEP 3#

#STEP 4 COMPLETED TOGETHER WITH STEP 1
#SEE NOTES AT STEP 1

#START OF STEP 5#

#activate dplyr package
#this was taught in the swirl exercises for this course
#very useful package used to manipulate data frames
library(dplyr)

#convert data_full into "data frame tbl" format
#this allows us to use the dplyr funtions on the data
Tidydata2 <- tbl_df(Tidydata)

#groups by SubjectID and Activity ID
#note dimensions of dataframe are still unchanged
Tidydata3 <- group_by(Tidydata2, SubjectID, ActivityID)

#calculates the mean of each variable in each subgroup
#so for Subject 1, mean of each variable for each activity
#We should have 30(subjects) x 6 (activities) = 180 rows in total
ResultData <- summarise_each(Tidydata3,funs(mean))

#END OF STEP 5#

#SAVE FINAL DATA SET#

write.table(ResultData, file = "./ResultData.txt", row.names= FALSE)

