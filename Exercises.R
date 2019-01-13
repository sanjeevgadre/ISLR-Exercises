#loading libraries
library(tidyverse)
library(ISLR)
library(car)

#Problem 8
attach(Auto)
linear_fit_1 = lm(mpg~horsepower, data=Auto)
summary(linear_fit_1)
predict_1 = predict(linear_fit_1, data.frame(horsepower=98), interval="confidence")
predict_2 = predict(linear_fit_1, data.frame(horsepower=98), interval="prediction")
predict_1
predict_2
plot(horsepower, mpg)
abline(linear_fit_1, col="Red")
par(mfrow=c(2,2))
plot(linear_fit_1)

#Commentary on problem 8
  #<i> Given the small p-value, there cleary is a relationship between the predictor (horsepower) and response (mpg).
  #<ii> This relationship can be classfied as significantly strong.
  #<iii> Given the coeffiecient (-0.16), the relationship between the predictor and response is negative or inverse.
  #<iv> The predicted mpg for horsepower 98 is 24.47. The confidence interval is 23.97-24.96 and the prediction interval is 14.81-34.12
#<c> The Residuals v/s Fitted value graph clearly shows that [a] the relationship between "mpeg" and "horsepower" is non linear [b] the R.squared value indicates that there is headroom for improvement and perhaps includes other predictors.

#Problem 9
plot(Auto)
cor(Auto[1:8])
linear_fit_2 = lm(mpg~.-name, data=Auto)
summary(linear_fit_2)
par(mfrow=c(2,2))
plot(linear_fit_2)

  #Use the Variance Inflation Factor to identify factors that are collinear i.e. factors with VIF > 5
  var_inf_factors = vif(linear_fit_2)
  col_factors = names(var_inf_factors[var_inf_factors[]>5])
  col_factors
  # The factors that are collinear and therefore likely to have either an interaction term or a power term are "cylinders" "displacement" "horsepower" "weight"
  
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
  #<e> & <f> We tried a few options and the option that included an interaction term between "cylinder" and "horsepower", "weight^2", "acceleration^2" and removed "displacement" and improved the R^2 value. Other options did not meaningfully improve R^2. In choosing terms to include in these non-linear forms, one was used the VIF scores for the predictors to identify collinear predictors.

#Problem 10
attach(Carseats)
linear_fit_6 = lm(Sales~Price+Urban+US, data=Carseats)
summary(linear_fit_6)
linear_fit_7 = update(linear_fit_6, ~.-Urban)
summary(linear_fit_7)
par(mfrow=c(2,2))
plot(linear_fit_7)
confint(linear_fit_7)

#Comments on problem 10
#<b> The "Sales" of Carseats are have negative relationships to the "Price", "Store location being Urban" and a positive relationship to "Store location is in US". 
#<c> Sales = 13.04-0.054*Price-0.02*Urban+1.2*US, where Urban=1 if the store location is in an urban area, 0 otherwise, and US=1 if the store location is in US, 0 otherwise.
#<d> Given the p-values, the null hypothesis can be rejected for "Price" and "US".
#<f> The two models in <a> and <e> do not fit well, evidenced by the low R^2 values.
#<h> There are no outliers or high leverage observations in model (e)

#Problem 11
set.seed(1)
x=rnorm(100)
y=2*x+rnorm(100)
linear_fit_8 = lm(y~x+0)
summary(linear_fit_8)
linear_fit_9 = lm(x~y+0)
summary(linear_fit_9)
linear_fit_8_a = update(linear_fit_8, ~.-0)
summary(linear_fit_8_a)
linear_fit_9_a = update(linear_fit_9, ~.-0)
summary(linear_fit_9_a)

#Comments on problem 11
#<a> The coefficient estimate Beta-hat is 1.99 and the associated t-statistic value is 18.73 and p-value is less than 2e-16. We can reject the null hypothesis that Beta-hat is 0 or that y is not related to x.
#<b> The coefficient estimate os 0.39, standard error in coefficient estimate is 0.021, the associated t value statistic is 18.73 and p-value is less than 2e-16. 
#<f> Shown by the summaries of linear_fit_8_a and linear_fit_9_a
