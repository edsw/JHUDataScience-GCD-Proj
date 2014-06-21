NROWS <- 1

read.num <- function(f) { read.table(f, colClasses = numeric(), header = FALSE, comment.char = "", nrows = NROWS) }

activitylabels <- read.table("activity_labels.txt")
cols <- c("subject", "activity", as.character(read.table("features.txt")$V2))

tidy1 <- cbind(
			read.num("test/subject_test.txt"),
			sapply(read.num("test/y_test.txt"), function(x) { activitylabels[x, 2] }),
			read.num("test/X_test.txt")
)

tidy2 <- cbind(
			read.num("train/subject_train.txt"),
			sapply(read.num("train/y_train.txt"), function(x) { activitylabels[x, 2] }),
			read.num("train/X_train.txt")
)

colnames(tidy1) <- colnames(tidy2) <- cols

tidy <- rbind(tidy1, tidy2)
tidy <- tidy[order(tidy$subject, tidy$activity), ]

row.names(tidy) <- NULL

write.table(tidy, "tidy_data.txt", row.names = FALSE)

subtidy <- tidy[, sapply(colnames(tidy), function(c) { grepl("^subject$|^activity$|std|mean[^Freq]", c) }, USE.NAMES = FALSE)]

write.table(subtidy, "tidy_data_mean_std.txt", row.names = FALSE)