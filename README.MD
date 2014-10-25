##INTRODUCTION

This "README" describes how to use the script "run_analysis" to get the tidy data set mentioned in Step 5.

##STEPS

1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the zip file.

3. From the zip file transfer the following files (subject_train.txt, y_train.txt, X_train.txt, subject_test.txt, y_test.txt, X_test.txt, features.txt) directly into your working directory. There should be 7 files in total.

4. DO NOT put them in any subfolders if not the script will not work. (you can of course adjust the file path in the script to fix this on your own)  

5. Before you run the script, make sure you have the "dplyr" package installed. To install type install.packages("dplyr") in your R console.

6. Run the script "run_analysis" in R.

7. A file titled "ResultData.txt" will be saved in your working directory. This is the tidy data set requested in Step 5.

8. For more details, see comments I have written within the "run_analysis" script itself.
