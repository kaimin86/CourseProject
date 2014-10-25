##Background:
30 volunteers within an age bracket of 19-48 years performed six activities (WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the phone's embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##Transformations:
1. Training and Test data sets were combined

2. I extracted only measurements on the mean and standard deviation for each measurement

3. For each measurement, I computed the mean for each activity carried out by each subject. For example: The first value in the "tBodyAcc-mean()-X" column corresponds to the mean value of that measurement for Subject 1 when he was laying down 

4. Final data set contains 81 variables and 180 observations

Explaining the Variables:
1. SubjectID is an integer which uniquely identifies each of the 30 subjects

2. ActivityID is a string that can take on 6 possible values - WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING, STANDING & LAYING

3. The other 79 variables correspond to the measurements captured by the phone's accelerometer and gyroscope. Each value corresponds to the mean value for each activity carried out by each subject (see point 3 in the Transformations section).
