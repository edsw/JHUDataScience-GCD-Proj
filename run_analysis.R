library("data.table")

# Set NROWS constant to -1 to process all rows in each file, or a positive value for a subset of rows.
NROWS <- 100

# Helper function to ensure that each file is read in the same manner, since they all have the same format.
read.num <- function(f) { read.table(f, colClasses = numeric(), header = FALSE, comment.char = "", nrows = NROWS) }

# Load activity labels and friendly column names for tidy output
activitylabels <- read.table("activity_labels.txt")
cols <- c("subject", "activity", as.character(read.table("features.txt")$V2))

# Load the test data
temp1 <- cbind(
			# Subjects
			read.num("test/subject_test.txt"),
			# Activities, substituting the character name for the numeric value
			sapply(read.num("test/y_test.txt"), function(x) { activitylabels[x, 2] }),
			# Data
			read.num("test/X_test.txt")
		 )

# Load the training data
temp2 <- cbind(
			# Subjects
			read.num("train/subject_train.txt"),
			# Activities, substituting the character name for the numeric value
			sapply(read.num("train/y_train.txt"), function(x) { activitylabels[x, 2] }),
			# Data
			read.num("train/X_train.txt")
		 )

# Replace the generic columns names with friendly names
colnames(temp1) <- colnames(temp2) <- cols

#Combine the test and training data sets, then order by subject and activity
tidy1 <- rbind(temp1, temp2)
tidy1 <- tidy1[order(tidy1$subject, tidy1$activity), ]

# Reset the row names to be sequential for tidy output
row.names(tidy1) <- NULL

# Subset the tidy data by selecting just columns pertaining to std() and mean() calculations
tidy2 <- tidy1[, sapply(colnames(tidy1), function(c) { grepl("^subject$|^activity$|std|mean[^Freq]", c) }, USE.NAMES = FALSE)]
# Group the tidy2 data by subject and activity with the mean for each data 
tidy3 <- data.table(tidy2)[, lapply(.SD, mean), by = c("subject", "activity")]

# Write tidy data sets out to files
write.table(tidy1, "tidy_data1.txt", row.names = FALSE)
write.table(tidy2, "tidy_data2.txt", row.names = FALSE)
write.table(tidy3, "tidy_data3.txt", row.names = FALSE)