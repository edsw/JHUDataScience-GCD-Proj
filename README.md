# Overview

This R script is prepared for the Getting and Cleaning Data course project in the Johns Hopkins 
University Bloomberg School of Public Health Data Science specialization on Coursera.

* __Version__: 1.0
* __Submitted__: 6/21/2014
* __Author__: Ed Swindelles
	* http://github.com/edswindelles
	* http://twitter.com/edswindelles

# Purpose

The purpose of this script is to produce a tidy dataset (1)(2)(3) from the Human Activity 
Recognition Using Smartphones Dataset (SmartLab at the University of Genova).  The dataset
is preprocessed, but spread across multiple files, with no data labeling or summarization. 
The dataset is split into two groups, test data (30% of total) and training data (70% of 
total).  This script combines the dataset files, summarizes, and labels.

# Usage

The script assumes that the current working directory is the extracted original dataset.

	setwd("/work/UCI HAR Dataset")
	source("/work/run_analysis.R")

The output of the script is three text files, each more tidy than the previous.

* __tidy_data1.txt__ - All records from both the test and training datasets in tidy format.
* __tidy_data2.txt__ - _tidy_data1_, with only columns pertaining to std() and mean() 
calculations.
* __tidy_data3.txt__ - _tidy_data2_, with only 1 row per subject/activity pairing, and the 
mean() of each column.

Each of the text files can be read into R using read.table().

	read.table("tidy_data1.txt")

# Code Book

The file CodeBook.md contains a detailed references of the methods used to generate tidy 
data from the original dataset.

## References
(1) Wickham, H. (submitted). Tidy Data. Journal of Statistical Software.  Retrieved from 
http://vita.had.co.nz/papers/tidy-data.pdf  
(2) Hood, D. (2014, June 14). Long Data, Wide Data, and Tidy Data for the Assignment.
Retrieved from https://class.coursera.org/getdata-004/forum/thread?thread_id=262  
(3) Leek, J. (2013, November 25). How to share data with a statistician.  Retrieved from 
https://github.com/jtleek/datasharing