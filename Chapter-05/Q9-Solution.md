9.a & 9.b
---------

    mu.hat = mean(Boston$medv)
    mu.hat*1000

    ## [1] 22532.81

    se.hat = sd(Boston$medv)/sqrt(length(Boston$medv))
    se.hat*1000

    ## [1] 408.8611

    mu.hat.range = c(mu.hat-qnorm(0.975)*se.hat, mu.hat+qnorm(0.975)*se.hat)
    mu.hat.range*1000

    ## [1] 21731.45 23334.16

The average of median values of owner-occupied houses across the towns
of Boston is $22,533 and 95% of these median values lie between $21,731
and $23,334.

9.c
---

    boot.fn = function(data,index){
        mu.hat = mean(data$medv[index])
        return(mu.hat)
    }

    set.seed(1)
    boot(Boston, boot.fn, R=1000)

    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = Boston, statistic = boot.fn, R = 1000)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##     original      bias    std. error
    ## t1* 22.53281 0.008517589   0.4119374

The bootstrap estimate of the standard error in mu.hat is $412. This
compares with $409 obtained from sample standard deviation in (b) above.

9.d
---

    c(mu.hat-qnorm(0.975)*0.412, mu.hat+qnorm(0.975)*0.412)*1000

    ## [1] 21725.30 23340.31

    t.test(Boston$medv)

    ## 
    ##  One Sample t-test
    ## 
    ## data:  Boston$medv
    ## t = 55.111, df = 505, p-value < 2.2e-16
    ## alternative hypothesis: true mean is not equal to 0
    ## 95 percent confidence interval:
    ##  21.72953 23.33608
    ## sample estimates:
    ## mean of x 
    ##  22.53281

The 95% confidence interval for mu.hat based on the bootstrap estimate
is $21,725 - $23,340. This compares with $21,730 - $23,336 obtained
using t.test(Boston$medv)

9.e & 9.f
---------

    median.hat=median(Boston$medv)
    median.hat

    ## [1] 21.2

    boot.median.fn = function(data,index){
      median.hat = median(data$medv[index])
      return(median.hat)
    }

    boot(Boston, boot.median.fn, R=1000)

    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = Boston, statistic = boot.median.fn, R = 1000)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##     original  bias    std. error
    ## t1*     21.2 -0.0098   0.3874004

The median value estimate of the medv in the population is $21,200 which
is slightly lower than the mean value estimate of medv in the population
which was $22,533

The bootstrap estimate for the standard error in the median value of
medv in the popuplation is $391 which compares to the estimate for the
standard error in the mean value of medv in the population which was
$412.

9.g & 9.h
---------

    mu.hat.10.percentile = quantile(Boston$medv, 0.1)
    mu.hat.10.percentile

    ##   10% 
    ## 12.75

    boot.10.percentile.fn = function(data,index){
      mu.hat.10.percentile = quantile(data$medv[index],0.1)
      return(mu.hat.10.percentile)
    }

    boot(Boston, boot.10.percentile.fn, R=1000)

    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = Boston, statistic = boot.10.percentile.fn, R = 1000)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##     original  bias    std. error
    ## t1*    12.75 0.00515   0.5113487

The bootstrap estimate of the standard error in the tenth percentile of
medv is $513. This compares with the bootstrap estimate of the standard
error in mean of medv of $412. Thus the confidence interval for the
tenth percentile of medv is much broader than that for the mean of medv.
This stands to reason as the number of observations available in
calculating the standard error in the tenth percentile is only a tenth
of the number of observations available in calculating the mean and
therefore there is greater uncertainity.
