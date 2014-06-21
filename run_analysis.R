### code for the course project

##1. Set working directory where the UCI HAR Dataset is located.

setwd()


##2. Get the test and training data
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = F)
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = F)
x_test<-read.table("./UCI HAR Dataset/test/x_test.txt", header = F)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt", header = F)
x_train<-read.table("./UCI HAR Dataset/train/x_train.txt", header = F)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt", header = F)

## 3. merge test and training datasets
#column bind
test<-cbind(y_test,subject_test,x_test)
train<-cbind(y_train,subject_train, x_train)

data<-rbind(test,train)

#4. import the feature names, name the columns
features<-read.table("./UCI HAR Dataset/features.txt", header = F)
feature_label<-c("id","subject",as.character(features[,2]))
colnames(data)<-feature_label

#5. extract measurements that have mean and standard deviation measurements.
data2<-data[,c(1:2,grep('mean|std', feature_label))]

#6. label descriptive variable names for the activities.
al<-read.table("./UCI HAR Dataset/activity_labels.txt", header = F)
index<-match(data2$id, al[,1])
data3<-cbind(al[index,2], data2)
colnames(data3)<-c("activity", colnames(data2))


#7. reshape data and find mean values

agg<-stats::aggregate(data3, by=list(data3$activity, data3$subject), FUN = mean)

#create tidy data set.
tidy_data<-agg[c(1:2, 6:ncol(agg))]
colnames(tidy_data)<-c("activity", "subject", colnames(agg[6:ncol(agg)]))
#write.table(tidy_data, "./tidy_data.txt", row.names = F)
