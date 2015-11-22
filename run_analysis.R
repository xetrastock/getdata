## read features from features.txt
featureNames = read.table("features.txt")  

## create a logical vector which specifies whether a feature in featureNames is a mean or std
fmean <- sapply(featureNames[,2],function(x) {regexpr("mean()",x,fixed=TRUE)})
fmean <- fmean!=-1
fstd <- sapply(featureNames[,2],function(x) {regexpr("std()",x,fixed=TRUE)})
fstd <- fstd!=-1
fextract <- fmean|fstd

## reads training/test data for features, activities and subjects
X_train = read.table("./train/X_train.txt")
y_train = read.table("./train/y_train.txt")
X_test = read.table("./test/X_test.txt")
y_test = read.table("./test/y_test.txt")
subject_test = read.table("./test/subject_test.txt")
subject_train = read.table("./train/subject_train.txt")

## extracts out only mean and std features for test and training data
X_train_sub <- X_train[,fextract==TRUE]
X_test_sub <- X_test[,fextract==TRUE]

## merges test and training data together for features, activities and subjects
X <- rbind(X_train_sub,X_test_sub)
y <- rbind(y_train,y_test)
subject <-rbind(subject_train,subject_test)

# merges features, activities and subjects data into one data frame.
data1 <- cbind(X,y,subject)

# labels the variables in the merged data frame
labels <- union(featureNames[fextract==TRUE,2],c("Activity","Subject"))
colnames(data1) <- labels

# converts the Activity variable into a factor variable
data1$Activity <- factor(data1$Activity)

# names the factors of the Activity variable with descriptive names
levels(data1$Activity) <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")

# creates a new data frame which contains the average of each feature for each activity and each subject
data2 <- aggregate(data1[,1:66], list(data1$Activity,data1$Subject), mean)

# renames the first two columns in the data frame
colnames(data2)[1:2]<- c("Activity","Subject")

# writes the second data frame to a text file
write.table(data2,"tidy_data.txt",row.names=FALSE)
