## ISLR-Chap7-Exercises

###Question - 6-b
Needed to estimated the optimal number of cuts to fit a stepwise regression. 
  
This requires first to, depending on the number of cuts, establish FOR THE ENTIRE DATASET a new variable that indicates the interval to which an observation belongs and then fit a regression for the response variable over this new variable.

This is especially necessary when performing crossfold validation as it is very likely that the test fold has observations that do not nicely fit into the intervals formed using only the training folds resulting in error.

It is also faster and more efficient to implement a cross fold validation function rather than depend on cv.glm() in library(boot). For stepwise regression function this is far more efficient.

###Question - 9
Here we have used the cv.glm() from library(boot) to estimate the cross fold validation error rather than write the function specifically

###Question - 10
Two step model building process: stepwise subset selection method to choose the optimal number of predictors to include in the final model. More importantly, we applied the 1-standard-deviation rule to select the smallest possible subset. In the second step we build a GAM to include possible non-linear relationships between the predictors and the response variable.

###Question - 11
Highlights how backfitting can be used to fit a gam to a given dataset.