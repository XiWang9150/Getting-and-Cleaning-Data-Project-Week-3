## Code Book
This file explains the variables, the mid-step data, the final data and descriptions of the codes for every step.

### Author : Xi Wang

### Background
* One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

### Data Resource
* Full Description
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

* Data for Project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Functions of "run_analysis.R"

* Step 1 :
Merges the training and the test sets to create one data set.
* Step 2 :
Extracts only the measurements on the mean and standard deviation for each measurement.
* Step 3
Uses descriptive activity names to name the activities in the data set
* Step 4 :
Appropriately labels the data set with descriptive variable names
* Step 5 :
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

### How does my script work?
1. Setting up working directory to my local folders.
2. reference **`plyr`** library
3. Reading in the data from txt files.  
**`features.txt`** --> **feature**  
**`activity_labels.txt`** --> **act_lab**  
**`x_train.txt`** --> **xtrain**  
**`y_train.txt`** --> **ytrain**  
**`subject_train.txt`** --> **sub_train**  
**`x_test.txt`** --> **xtest**  
**`y_test.txt`** --> **ytest**  
**subject_test.txt** --> **sub_test**  
4. To avoid confusing definitions, processing and renaming the header for y_train.txt, y_test.txt, subject_train.txt and subject_test.txt.   
For **`y_train.txt`**, **`"V1"`** --> **"V_Act_Lab"**  
For **`y_test.txt`**, **`"V1"`** --> **"V_Act_Lab"**  
For **`subject_train.txt`**, **`"V1"`** --> **"Subject"**  
For **`subject_test.txt`**, **`"V1"`** --> **"Subject"**  
5. Generating train_data from xtrain and ytrain
6. Generating test_data from xtest and ytest
7. Getting the full tidy data **data_f**
8. Extracting the data with mean and standard deviation.
9. Getting the processed data only with mean and standard deviation.
10. Merging Activity Label and the full tidy data  
For **`y_train.txt`**,  
**`"V1"`** --> **"ID"**  
**`"V2"`** --> **`"ACT_LABEL"**
11. Now we have the first tidy data and write them out to **`tidy_data_1.txt`**
12. Creating the second tidy data with average of each variable for each activity and each subject
13. Writing second set data out to **`tidy_data_2.txt`**
14. All Done. You may verify and review the two sets of data **`tidy_data_1.txt`** and **`tidy_data_2.txt`**

© All Rights Reserved - Written by Xi Wang 2015