# ISLR-Chap8-Exercises

###Question 7
We used the melt() from library(reshape2) that allows us to efficiently plot on a single graph multiple data series present in columns. The melt function turns a wide dataframe into a long dataframe and is akin to gather() from library(tidyr)


###Question 8
Good example of how pruning does not always help. In this case pruning using cross validation helped optimise the training set error but did not improve the test set error.

In the same vein, a Random Forest ensemble does not always help in reducing the number of predictors when compared to a Bagging ensemble.