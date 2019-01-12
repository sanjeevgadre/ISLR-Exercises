# ISLR-Chap8-Exercises

###Question 7
We used the melt() from library(reshape2) that allows us to efficiently plot on a single graph multiple data series present in columns. The melt function turns a wide dataframe into a long dataframe and is akin to gather() from library(tidyr)


###Question 8
Good example of how pruning does not always help. In this case pruning using cross validation helped optimise the training set error but did not improve the test set error.

In the same vein, a Random Forest ensemble does not always help in reducing the number of predictors when compared to a Bagging ensemble.

###Question 10
Good example of how Boosting ensemble does not always deliver the best results. Here we find that KNN classification model does a much better job and even a Logistic classificaion model outperforms Boosting.

Also good example of how different libraries expect different data-tpes as input. gbm() requires that the value of the response variable in the training observations is {0,1} where as both knn() and glm() expects that the response variable is a factor variable.