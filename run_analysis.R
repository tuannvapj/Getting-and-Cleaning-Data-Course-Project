library(dplyr)
# 1. Merges the training and the test sets to create one data set.

# read x data
x_train_file <- "train/X_train.txt"
x_train_df <- fread(x_train_file)
x_test_file <- "test/X_test.txt"
x_test_df <- fread(x_test_file)
# read y data
y_train_file <- "train/y_train.txt"
y_train_df <- fread(y_train_file)
y_test_file <- "test/y_test.txt"
y_test_df <- fread(y_test_file)
# read subject data
subject_train_file <- "train/subject_train.txt"
subject_train_df <- fread(subject_train_file)
subject_test_file <- "test/subject_test.txt"
subject_test_df <- fread(subject_test_file)
# combine train and test data
x <- rbind(x_train_df, x_test_df)
features_name <- read.table("./features.txt")
setnames(x, features_name$V2)
y <- rbind(y_train_df, y_test_df)
setnames(y, "V1", "activity_label")
subject <- rbind(subject_train_df, subject_test_df)
setnames(subject, "V1", "subject")
data_merge <- cbind(x,y,subject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
data_mean_std <- select(data_merge, names(data_merge)[grepl("mean\\(\\)|std\\(\\)|activity_label|subject", names(data_merge))])

# 3. Uses descriptive activity names to name the activities in the data set
activity_file <- "activity_labels.txt"
activity_df <- read.table(activity_file)
setnames(activity_df, names(activity_df), c("activity_label", "activity_name"))

# 4. Appropriately labels the data set with descriptive variable names.
data_appropriately_labels <- merge(data_mean_std, activity_df, by.x = "activity_label", by.y = "activity_label", all = TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

features_name <- grep("mean\\(\\)|std\\(\\)", names(data_appropriately_labels), value = TRUE)
df_melt <- melt(data_appropriately_labels, id=c("activity_label", "subject"), measure.vars = features_name)
data_tiny <- dcast(df_melt, activity_label + subject ~ variable, mean)
write.table(data_tiny, "data_tiny.txt", row.names = FALSE)
