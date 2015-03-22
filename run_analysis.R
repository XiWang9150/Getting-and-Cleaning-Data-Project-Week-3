# This is the code for Getting-and-Cleaning-Data Project Week3

# Setting up the working directory
setwd("E:/DataScience/Getting-and-Cleaning/Project-wk3/code")

# WE might need plyr to process data frame analysis
library(plyr)

# 1.Merges the training and the test sets to create one data set.
# - Reading data
feature <- read.table("../features.txt")
act_lab <- read.table("../activity_labels.txt")
xtrain <- read.table("../train/x_train.txt")
ytrain <- read.table("../train/y_train.txt")
sub_train <- read.table("../train/subject_train.txt")
xtest <- read.table("../test/x_test.txt")
ytest <- read.table("../test/y_test.txt")
sub_test <- read.table("../test/subject_test.txt")
# In order to aviod duplicated name, renaming ytrain and ytest
ytrain <- rename(ytrain, c("V1" = "V_Act_Lab"))
ytest <- rename(ytest, c("V1" = "V_Act_Lab"))

# In order to aviod duplicated name, renaming ytrain and ytest
sub_train <- rename(sub_train, c("V1" = "Subject"))
sub_test <- rename(sub_test, c("V1" = "Subject"))

# - Assemble and combine data frame
# For training data
# xtrain 7352*V561
# ytrain 7352*1 (1-6)
train_data <- cbind(ytrain,xtrain)
#train_data <- cbind(train_data,sub_train)

# For test data
# xtest 2947*V561
# ytest 2947*1 (1-6)
test_data <- cbind(ytest,xtest)
#test_data <- cbind(test_data,sub_test)

# Get the tidy data
data_f <- rbind(train_data,test_data)
data_sub <- rbind(sub_train,sub_test)


# 2.Extracts only the measurements on the mean and standard deviation for 
#   each measurement
mean_and_std <- grep("-(mean|std)\\(\\)", feature[, 2])

# Because I have already bind the subject into the first column, Adding 0th 
# column here
mean_and_std <- as.numeric(c(0,mean_and_std))

useful_data <- data_f[,mean_and_std+1]

# I will do item 3 and item 4 togethere
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
act_lab <- rename(act_lab, c("V1" = "ID"))
act_lab <- rename(act_lab, c("V2" = "ACT_LABEL"))

tidy_data <- merge(act_lab,useful_data,by.x="ID",by.y="V_Act_Lab",all = TRUE)

write.table(tidy_data, "tidy_data_1.txt", row.name=FALSE)

# 5.From the data set in step 4, creates a second
#   independent tidy data set with the average of each variable for 
#   each activity and each subject.

data_2 <- cbind(data_sub,tidy_data)
tidy_data_ave <- ddply(data_2, .(Subject,ACT_LABEL), function(x) 
  colMeans(data_2[,4:69]))
write.table(tidy_data_ave, "tidy_data_2.txt", row.name=FALSE)
