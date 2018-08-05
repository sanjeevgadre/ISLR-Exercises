Including the necessary libraries

    library(ISLR)
    library(car)
    library(tidyverse)

Problem 14
----------

14.a
====

    set.seed(1)
    x1 = runif(100)
    x2 = 0.5*x1+rnorm(100)/10
    y = 2+2*x1+0.3*x2+rnorm(100)

This linear model is of the form Y= beta-0 + (beta-1)X1 + (beta\_2)X2 +
std. normal error and the regression coefficeints are beta-0 = 2, beta-1
= 2 and beta-2 = 0.3.

14.b
====

![](Q14_Solution_files/figure-markdown_strict/unnamed-chunk-2-1.png)

As the plot above shows, x2 is linearly related to the x1. This is to be
expected as x2 is defined as linear function of x1

14.c
====

    linear_fit_1 = lm(y~x1+x2)
    summary_1 = summary(linear_fit_1)
    summary_1

    ## 
    ## Call:
    ## lm(formula = y ~ x1 + x2)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8311 -0.7273 -0.0537  0.6338  2.3359 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   2.1305     0.2319   9.188 7.61e-15 ***
    ## x1            1.4396     0.7212   1.996   0.0487 *  
    ## x2            1.0097     1.1337   0.891   0.3754    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.056 on 97 degrees of freedom
    ## Multiple R-squared:  0.2088, Adjusted R-squared:  0.1925 
    ## F-statistic:  12.8 on 2 and 97 DF,  p-value: 1.164e-05

The summary results indicate: *x2 with a low p-value is not a
significant predictor of y*

    ## [1] 0.375

*The R-squared value is quite low, indicating a poor fit*

    ## [1] 0.209

The three coefficients beta-hat-0, beta-hat-1 and beta-hat-2,
respectively are

    ## [1] 2.1305

    ## [1] 1.439555

    ## [1] 1.009674

Clearly only beta\_hat\_0 compares well with beta\_0. beta\_hat\_1 is
somewhat comparable to beta\_1 but beta\_hat\_2 is way off beta\_2

However, the *F-statistic for the overall fit has a low p-value*,
indicating that the hypothesis that x1 and/or x2 are predictors of y may
not be dismissed, though from the summary results its clear that for
**this fit** x2 is not a good predictor of y.

14.d
====

    linear_fit_2 = lm(y~x1)
    summary_2 = summary(linear_fit_2)
    summary_2

    ## 
    ## Call:
    ## lm(formula = y ~ x1)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.89495 -0.66874 -0.07785  0.59221  2.45560 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   2.1124     0.2307   9.155 8.27e-15 ***
    ## x1            1.9759     0.3963   4.986 2.66e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.055 on 98 degrees of freedom
    ## Multiple R-squared:  0.2024, Adjusted R-squared:  0.1942 
    ## F-statistic: 24.86 on 1 and 98 DF,  p-value: 2.661e-06

The summary results for y~x1 fit indicate: *x1 is a strong predictor of
y because of its low p-value of*

    ## [1] 2.66e-06

*The fit quality is not very good given a low R-squared value of*

    ## [1] 0.2023601

Given the high F-statistic value with a corresponding low p-valeue we
**cannot reject** the null hypothesis beta\_1 = 0

14.e
====

    linear_fit_3 = lm(y~x2)
    summary_3 = summary(linear_fit_3)
    summary_3

    ## 
    ## Call:
    ## lm(formula = y ~ x2)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.62687 -0.75156 -0.03598  0.72383  2.44890 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   2.3899     0.1949   12.26  < 2e-16 ***
    ## x2            2.8996     0.6330    4.58 1.37e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.072 on 98 degrees of freedom
    ## Multiple R-squared:  0.1763, Adjusted R-squared:  0.1679 
    ## F-statistic: 20.98 on 1 and 98 DF,  p-value: 1.366e-05

The summary results for y~x2 fit indicate: *x2 is a strong predictor of
y because of its low p-value of*

    ## [1] 1.37e-05

*The fit quality is not very good given a low R-squared value of*

    ## [1] 0.1763304

Given the high F-statistic value with a corresponding low p-valeue we
**cannot reject** the null hypothesis beta\_1 = 0

14.f
====

The results in \[c\] and \[e\] do not contradict. When both x1 and x2
are used as predictors, because they are collinear, one of them
becomes"insignificant" when describing a fit. However when each of them
is used separately and indivudually, they do indeed provide a prediction
of y. The collinearity between x1 and x2 is obvious when we compute
their correlations as below:

    cor(x1,x2)

    ## [1] 0.8351212

14.g
====

    x1 = c(x1, 0.1)
    x2 = c(x2, 0.8)
    y = c(y, 6)

    linear_fit_1a = lm(y~x1+x2)
    summary_1a = summary(linear_fit_1a)
    summary_1a

    ## 
    ## Call:
    ## lm(formula = y ~ x1 + x2)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.73348 -0.69318 -0.05263  0.66385  2.30619 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   2.2267     0.2314   9.624 7.91e-16 ***
    ## x1            0.5394     0.5922   0.911  0.36458    
    ## x2            2.5146     0.8977   2.801  0.00614 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.075 on 98 degrees of freedom
    ## Multiple R-squared:  0.2188, Adjusted R-squared:  0.2029 
    ## F-statistic: 13.72 on 2 and 98 DF,  p-value: 5.564e-06

    linear_fit_2a = lm(y~x1)
    summary_2a = summary(linear_fit_2a)
    summary_2a

    ## 
    ## Call:
    ## lm(formula = y ~ x1)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -2.8897 -0.6556 -0.0909  0.5682  3.5665 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   2.2569     0.2390   9.445 1.78e-15 ***
    ## x1            1.7657     0.4124   4.282 4.29e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.111 on 99 degrees of freedom
    ## Multiple R-squared:  0.1562, Adjusted R-squared:  0.1477 
    ## F-statistic: 18.33 on 1 and 99 DF,  p-value: 4.295e-05

    linear_fit_3a = lm(y~x2)
    summary_3a = summary(linear_fit_3a)
    summary_3a

    ## 
    ## Call:
    ## lm(formula = y ~ x2)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.64729 -0.71021 -0.06899  0.72699  2.38074 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   2.3451     0.1912  12.264  < 2e-16 ***
    ## x2            3.1190     0.6040   5.164 1.25e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.074 on 99 degrees of freedom
    ## Multiple R-squared:  0.2122, Adjusted R-squared:  0.2042 
    ## F-statistic: 26.66 on 1 and 99 DF,  p-value: 1.253e-06

Comparing the 3 models with respective updated models:

    ## [1] "y~x1+x2"

    ##          R_squared   beta_0    beta_1   beta_2
    ## Original 0.2088293 2.130500 1.4395554 1.009674
    ## Updated  0.2187973 2.226692 0.5394397 2.514569

    ## [1] "y~x1"

    ##          R_squared   beta_0   beta_1
    ## Original 0.2023601 2.112394 1.975929
    ## Updated  0.1562497 2.256927 1.765695

    ## [1] "y~x2"

    ##          R_squared   beta_0   beta_1
    ## Original 0.1763304 2.389949 2.899585
    ## Updated  0.2121829 2.345107 3.119050

The introduction of the mis-measured term has impact on all three models
affecting the R-squared and the beta-0, beta-1 and beta-2 coefficient
values. In effect the model definition changed in all three cases.

To determine if the mis-measured term is an outlier we ascertain if the
absolute value of the studentized residual of the term is greater than
or equal to 3

    ## [1] "for y~x1+x2"

    ##   101 
    ## FALSE

    ## [1] "for y~x1"

    ##  101 
    ## TRUE

    ## [1] "for y~x2"

    ##   101 
    ## FALSE

Clearly for the model y~x1, the mis measured term is an outlier

To determine if the mismeasured term is a high leverage term, we
ascertain how much the leverage statistic (hatvalue) for the term exeeds
(p+1)/n where p is the number of predictors and n is number of
observations

    ## [1] "for y~x1+x2"

    ##      101 
    ## 13.96252

    ## [1] "for y~x1"

    ##      101 
    ## 1.690314

    ## [1] "for y~x2"

    ##      101 
    ## 5.116185

For the y~x1+x2, the mismeasured term is clearly a high leverage term.
It is also a possibly high leverage term for the y~x2 model.

This further explains the changes in the 3 models by introduction of
this mis measured term. From the comparison tables above the y~x1+x2 has
clearly changed the most. y~x1 is affected because this term is an
outlier term in this model and y~x2 is affected because this term is a
relativel high leverage term.
