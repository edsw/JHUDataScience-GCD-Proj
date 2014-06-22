# Raw Data

The raw dataset for the Human Activity Recognition Using Smartphones Dataset is available 
from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

# Tidy Data

## Overview

The raw datasets do not have any row or column names, and are spread across multiple files. 
The intent of the tidy dataset is to combine the test and training datasets into a single 
dataset, with additional columns added for grouping (subject, activity).

## Dataset 1

The first dataset is the basis for Dataset 2 and Dataset 3.

This dataset inserts two columns to the left of the combined test and training datasets: 
subject and activity.  Subject is the numeric value representing each person who
participated in the study.  Activity is the textual name of the activity being measured in 
that row of data.  Each set of subject and activity is measured many times, as described in 
features_info.txt of the original dataset.  Therefore, each permutation of subject and 
activity will appear multiple times in Dataset 1.

The rest of the columns are the measurements for each subject/activity grouping.  For each 
measurement, a set of variables was calculated.  There are 561 total columns of variables 
for each measurement in this dataset.  The column names are derived from the features.txt 
file in the orignal dataset, and described in its features_info.txt.

The output file for this dataset is _tidy_data1.txt_.

## Dataset 2

To further summarize the dataset, the measurement columns from Dataset 1 were limited to 
only those pertaining to calculations of standard deviation, std(), and mean, mean().  As 
in Dataset 1, each permutation of subject and activity appears multiple times, for each 
measurement that was recorded.

The output file for this dataset is _tidy_data2.txt_.

## Dataset 3

To further summarize the dataset, each permutation of subject and activity from Dataset 
2 was reduced to a single row.  The measurement columns for each permutation were 
aggregated using the mean() function.

The output file for this dataset is _tidy_data3.txt_.
