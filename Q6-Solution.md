    library(ISLR)
    library(tidyverse)
    library(boot)

    data("Default")

6.a
---

    glm_fit_6a = glm(default~income+balance, data=Default, family=binomial)
    std_errors_6a = summary(glm_fit_6a)$coefficients[2:3,2]
    std_errors_6a

    ##       income      balance 
    ## 4.985167e-06 2.273731e-04

6.b&c
-----

    set.seed(1)
    boot.fn = function(data,index){
      glm_fit = glm(default~income+balance, data=data, family=binomial, subset=index)
      coeffs = summary(glm_fit)$coefficients[2:3,1]
      return(coeffs)
    }

    boot(Default,boot.fn, R=1000)

    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = Default, statistic = boot.fn, R = 1000)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##         original       bias     std. error
    ## t1* 2.080898e-05 5.870933e-08 4.582525e-06
    ## t2* 5.647103e-03 2.299970e-06 2.267955e-04

6.d
---

The glm() function returns standard errors for the two coefficients
"income" and "balance" as 4.985exp(-6) and 2.274exp(-4). The boot()
function returns comparatively smmaler standard error values for the two
coefficients - 4.583exp(-06) and 2.268exp(-4).
