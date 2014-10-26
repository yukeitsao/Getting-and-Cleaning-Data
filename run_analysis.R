library(data.table)
#setwd("D:\\Get and Clean Data")
path <- getwd()
pathIn <- file.path(path, "UCI HAR Dataset")


#Merge the subject id from train and test data.
train_subject <- fread(file.path(pathIn,"train","subject_train.txt"))
test_subject <- fread(file.path(pathIn,"test","subject_test.txt"))
subject <- rbind(train_subject,test_subject)


#Merge activity_number and subject id as the first two column in mergedata. 
activity_labels <- fread(file.path(pathIn,"activity_labels.txt"))
setnames(activity_labels,c("activity_num", "activity_name"))
train_activity_num <- fread(file.path(pathIn,"train","y_train.txt"))
test_activity_num <- fread(file.path(pathIn,"test","y_test.txt"))
activity_num <- rbind(train_activity_num,test_activity_num)
two_col <- cbind(subject,activity_num)
setnames(two_col,c("subject","activity_num"))


#Merge train_data and test_data and extract the mean() and std() function.
train_data <- read.table(file.path(pathIn,"train","X_train.txt"))
test_data <- read.table(file.path(pathIn,"test","X_test.txt"))
train_test_data <- rbind(train_data,test_data)
featurenames <- fread(file.path(pathIn,"features.txt"))
elect_num <- which(grepl("std|mean",featurenames$V2))
colnames(train_test_data) <- featurenames$V2
mean_std_data <- train_test_data[,elect_num]


#Merge subject id,activity number and mean_std_data from last part.
original_data <- cbind(two_col,mean_std_data)


#use activity names to label replace activity number.
setkey(original_data,subject,activity_num)
activityName_data <- merge(original_data,activity_labels,by="activity_num",all.x=TRUE)


#compute the average of each activity name’s value in each subject id. The outcome is "final_mean.txt"
q <- as.data.frame(activityName_data)
compute_mean_data <- aggregate(q[,3:81], by = list(q$subject, q$activity_name), FUN = mean)
setnames(compute_mean_data,c("Group.1","Group.2"),c("subject","activity_name"))
colnames(compute_mean_data) <- gsub("-","_",names(compute_mean_data))#除去-，不知道问什么说列名错误
colnames(compute_mean_data) <- sub("\\()","",names(compute_mean_data))#去括号，影响list(tBodyAcc_mean_Z)
write.table(compute_mean_data,"final_mean.txt",row.names=FALSE)
