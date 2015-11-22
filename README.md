# run_analysis.R script descriptionread

**Extract the dataset into your working directory before running run_analysis.R script**

## Create first tidy data set

*read features from features.txt
*create a logical vector which specifies whether a feature in featureNames is a mean or std
*reads training/test data for features, activities and subjects
*extracts out only mean and std features for test and training data
*merges test and training data together for features, activities and subjects
*merges features, activities and subjects data into one data frame.
*labels the variables in the merged data frame
*converts the Activity variable into a factor variable
*names the factors of the Activity variable with descriptive names

## Creat second tidy data set

*creates a new data frame which contains the average of each feature for each activity and each subject
*renames the first two columns in the data frame
*writes the second data frame to a text file

# code book

* Describes each of the variables in the data set.
* Indicates values of the feature variables have been normalised and lie within [-1,1]