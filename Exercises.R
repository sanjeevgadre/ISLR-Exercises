#loading libraries
library(tidyverse)
library(ISLR)

#Problem 8
attach(Auto)
linear_fit_1 = lm(mpg~horsepower, data=Auto)
summary(linear_fit_1)
predict_1 = predict(linear_fit_1, data.frame(horsepower=98), interval="confidence")
predict_2 = predict(linear_fit_1, data.frame(horsepower=98), interval="prediction")
predict_1
predict_2

#Commentary on problem 8
  #<i> Given the small p-value, there cleary is a relationship between the predictor (horsepower) and response (mpg).
  #<ii> This relationship can be classfied as significantly strong.
  #<iii> Given the coeffiecient (-0.16), the relationship between the predictor and response is negative or inverse.
  #<iv> The predicted mpg for horsepower 98 is 24.47. The confidence interval is 23.97-24.96 and the prediction interval is 14.81-34.12

#Problem 9
plot(Auto)
cor(Auto[1:8])
linear_fit_2 = lm(mpg~.-name, data=Auto)
summary(linear_fit_2)
par(mfrow=c(2,2))
plot(linear_fit_2)
linear_fit_3 = lm(mpg~.-name+cylinders:horsepower, data=Auto)
summary(linear_fit_3)
linear_fit_4 = lm(mpg~.-name+cylinders:horsepower+I(weight^2), data=Auto)
summary(linear_fit_4)
linear_fit_5= lm(mpg~.-name+cylinders:horsepower-displacement+I(weight^2)+I(acceleration^2), data=Auto)
summary(linear_fit_5)
Overall_Summary = data.frame(Fits=c("1","2","3","4","5"), R_2 = c(summary(linear_fit_1)$r.squared, summary(linear_fit_2)$r.squared, summary(linear_fit_3)$r.squared, summary(linear_fit_4)$r.squared, summary(linear_fit_5)$r.squared))
Overall_Summary

#Commentary on problem 9
  #<c-i> Given the low p-value for the overall F-statistic, we can infer that there is indeed a relationship between the predictors and the response.
  #<c-ii> The predictors with statistically significant relationship to the response are "displacement", "weight", "year", "origin".
  #<c-iii> The coefficeint of year suggests that mpg is positively correleated to the year of manufacture i.e. with passing years the engine efficency has improved.
  #<d> The Residuals vs Fitted plot suggests that there is some non-linear relationship between one or more predictors and response. The residual plot identifues datapoints 323, 326 and 327 as unusually large outliers (with studentized residuals of greater than 3) and observation 14 (with leverage value that greatly exceeds p+1/n i.e. 7+1/392 = 0.02) with unusually large leverage.
  #<e> & <f> We tried a few options and the option that included an interaction term between "cylinder" and "horsepower", "weight^2", "acceleration^2" and removed "displacement" improved the R^2 value and further improvement was achieved by including the square of weight. Other options did not meaningfully improve R^2. In choosing terms to include in these non-linear forms, one was looking to improve those terms that by themselves were not significant.

