## File : run_analysis.R
## Date : 23/08/2014
## Author: L. Thijssen
## Comment: 

## Start part 1 of assignment
## Reading X_test.txt in a dataframe
X_test <-read.table("X_test.txt")
## Result dim(X_test) 2947 46
X_train <-read.table("X_train.txt")
## Result dim(X_train) 7352 561
## Reading features.txt in a dataframe
features <-read.table("features.txt")
## dim 561 2
## Only selecting the columnname from dataframe and putting in character vector
headerx <-as.character(features$V2)
## replacing columnheaders for X_train by headerx
colnames(X_train) <- headerx
## replacing columnheaders for X_test by headerx
colnames(X_test)  <- headerx
## Making first part of the final set (train and test combined with header)
part1 <- rbind(X_train,X_test)
## dim part 1 10299 561

## Reading subject_train in dataframe subject_train
subject_train <- read.table("subject_train.txt")
## Reading subject_test in dataframe subject_test
subject_test <- read.table("subject_test.txt")
## Giving subject_test columname Subject 
colnames(subject_test) <- c("Subject")
## Idem subject_train
colnames(subject_train) <- c("Subject")
## Combining dataframs subject_train and subject_test to part2
part2 <-  rbind(subject_train, subject_test)
## dim part2 10299 1

## Reading y_train in dataframe y_train
y_train <- read.table("y_train.txt")
## Reading y_test in dataframe y_test
y_test <- read.table("y_test.txt")
## Giving y_train columname Activity 
colnames(y_train) <- c("Activity")
## Idem y_test
colnames(y_test) <- c("Activity")
part3 <-  rbind(y_train, y_test)

## Reading labels in dataframe 
activity_labels <- read.table("activity_labels.txt")
## Giving colnames to activity_labels
colnames(activity_labels) <- c("Activity", "Description_Activity")

## Join part3 and activity_labels into mergedData to get description in a data frame joining by Activity
## load library plyr
mergedData <- join(part3,activity_labels)
## Make help dataframe 4 with contains only the Description_Activity
part4 <- data.frame(mergedData[ ,c("Description_Activity")])

## Now column-binding part1, part2 and part4 to the final dataframe final1
final1 <- cbind(part1, part2, part4)
## End of part 1 of assignment


## Start part 2 of assignment
#Make select-list for columns with std in columnname
selcols1 <- grep("std", names(final1))
#Make select-list for columns with mean in columnname
selcols2 <- grep("mean", names(final1))
#Make select-list for columns with Subject in columnname
selcols3 <- grep("Subject",names(final1))
#Make select-list for columns with Activity in columnname
selcols4 <- grep("Activity", names(final1))

## subsetting dataframes on columnselections
stdtmp <-data.frame(final1[,selcols1])
meantmp <-data.frame(final1[,selcols2])
subtmp <-data.frame(final1[,selcols3])
acttmp <-data.frame(final1[,selcols4])

## Combining seperate data.frames to one
tottmp <-cbind(stdtmp,meantmp,subtmp, acttmp)
## dim tottmp 10299 , 81
## End of part 2 ofassignment

## Start of part 3 giving correct activity names
## Rename correct column to Subject cq Activity
names(tottmp) [names(tottmp)== colnames(tottmp)[80]] <- "Subject"
names(tottmp) [names(tottmp)== colnames(tottmp)[81]] <- "Activity"

## End of part 3 of the assignment

## Begin part 4 of assignment
## End part 4 of assignment

## Begin part 5 of assignment
library(reshape2)
## Melting dataframe to Subject and Activity
tottmpmelt <- melt(tottmp, id = c("Subject","Activity"))
## aggregatet tottmpmelt by Subject and Activity and get the mean of this group 
tidyset <- dcast(tottmpmelt, Subject+Activity~ variable, mean)
## Writing dataframe tidyset to txt-file
write.table(tidyset,file="/tmp/tidyset.txt",row.names=F)
## End part 5 of assignment







