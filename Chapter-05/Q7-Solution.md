    library(ISLR)
    library(tidyverse)
    data("Weekly")

7.a
---

    glm_fit_7a = glm(Direction~Lag1+Lag2, data=Weekly, family=binomial)
    summary(glm_fit_7a)

    ## 
    ## Call:
    ## glm(formula = Direction ~ Lag1 + Lag2, family = binomial, data = Weekly)
    ## 
    ## Deviance Residuals: 
    ##    Min      1Q  Median      3Q     Max  
    ## -1.623  -1.261   1.001   1.083   1.506  
    ## 
    ## Coefficients:
    ##             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)  0.22122    0.06147   3.599 0.000319 ***
    ## Lag1        -0.03872    0.02622  -1.477 0.139672    
    ## Lag2         0.06025    0.02655   2.270 0.023232 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 1496.2  on 1088  degrees of freedom
    ## Residual deviance: 1488.2  on 1086  degrees of freedom
    ## AIC: 1494.2
    ## 
    ## Number of Fisher Scoring iterations: 4

7.b&c
-----

    lOO_number=1

    glm_fit_7b = glm(Direction~Lag1+Lag2, data=Weekly, family=binomial, subset=-lOO_number)

    glm_prob_7b = predict(glm_fit_7b, newdata=Weekly[lOO_number,], type="response")
    glm_pred_7b = ifelse(glm_prob_7b>0.5,"Up","Down")

    error_7b = ifelse(glm_pred_7b!=Weekly[lOO_number,]$Direction, 1, 0)
    error_7b

    ## [1] 1

The first observation is incorrectly predicted.

7.d
---

    set.seed(1)

    pred_error = function(x){
      glm_fit_7d = glm(Direction~Lag1+Lag2, data=Weekly, family=binomial, subset=-x)

      glm_prob_7d = predict(glm_fit_7d, newdata=Weekly[x,], type="response")
      glm_pred_7d = ifelse(glm_prob_7d>0.5,"Up","Down")

      error = ifelse(glm_pred_7d!=Weekly[x,]$Direction, 1, 0)
      return(error)
    }

    error_7d = sapply(1:nrow(Weekly), pred_error)

    LOOCV_error_7d = mean(error_7d)
    LOOCV_error_7d

    ## [1] 0.4499541

7.e
---

The LOOCV procedure in 7.d above reported an LOOCV error rate of 45% i.e
the fit is likely to correctly predict 55% of test data.
