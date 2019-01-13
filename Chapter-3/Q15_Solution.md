Including the necessary libraries

    library(ISLR)
    library(car)
    library(tidyverse)
    library(MASS)
    attach(Boston)

Problem 15
----------

15.a
====

    linear_fit_zn = lm(crim~zn, data=Boston)
    summary_zn = summary(linear_fit_zn)

    linear_fit_indus = lm(crim~indus, data=Boston)
    summary_indus = summary(linear_fit_indus)

    linear_fit_chas = lm(crim~chas, data=Boston)
    summary_chas = summary(linear_fit_chas)

    linear_fit_nox = lm(crim~nox, data=Boston)
    summary_nox = summary(linear_fit_nox)

    linear_fit_rm = lm(crim~rm, data=Boston)
    summary_rm = summary(linear_fit_rm)

    linear_fit_age = lm(crim~age, data=Boston)
    summary_age = summary(linear_fit_age)

    linear_fit_dis = lm(crim~dis, data=Boston)
    summary_dis = summary(linear_fit_dis)

    linear_fit_rad = lm(crim~rad, data=Boston)
    summary_rad = summary(linear_fit_rad)

    linear_fit_tax = lm(crim~tax, data=Boston)
    summary_tax = summary(linear_fit_tax)

    linear_fit_ptratio = lm(crim~ptratio, data=Boston)
    summary_ptratio = summary(linear_fit_ptratio)

    linear_fit_black = lm(crim~black, data=Boston)
    summary_black = summary(linear_fit_black)

    linear_fit_lstat = lm(crim~lstat, data=Boston)
    summary_lstat = summary(linear_fit_lstat)

    linear_fit_medv = lm(crim~medv, data=Boston)
    summary_medv = summary(linear_fit_medv)

    row_names = names(Boston)[2:14]
    summary_df = data.frame(R_sq = c(summary_zn$r.squared, summary_indus$r.squared, summary_chas$r.squared, summary_nox$r.squared, summary_rm$r.squared, summary_age$r.squared, summary_dis$r.squared, summary_rad$r.squared, summary_tax$r.squared, summary_ptratio$r.squared, summary_black$r.squared, summary_lstat$r.squared, summary_medv$r.squared), P_value = c(summary_zn$coefficients[2,4], summary_indus$coefficients[2,4], summary_chas$coefficients[2,4], summary_nox$coefficients[2,4], summary_rm$coefficients[2,4], summary_age$coefficients[2,4], summary_dis$coefficients[2,4], summary_rad$coefficients[2,4], summary_tax$coefficients[2,4], summary_ptratio$coefficients[2,4], summary_black$coefficients[2,4], summary_lstat$coefficients[2,4], summary_medv$coefficients[2,4]), coefficients = c(summary_zn$coefficients[2,1], summary_indus$coefficients[2,1], summary_chas$coefficients[2,1], summary_nox$coefficients[2,1], summary_rm$coefficients[2,1], summary_age$coefficients[2,1], summary_dis$coefficients[2,1], summary_rad$coefficients[2,1], summary_tax$coefficients[2,1], summary_ptratio$coefficients[2,1], summary_black$coefficients[2,1], summary_lstat$coefficients[2,1], summary_medv$coefficients[2,1]), row.names = row_names)
    summary_df

    ##                R_sq      P_value coefficients
    ## zn      0.040187908 5.506472e-06  -0.07393498
    ## indus   0.165310070 1.450349e-21   0.50977633
    ## chas    0.003123869 2.094345e-01  -1.89277655
    ## nox     0.177217182 3.751739e-23  31.24853120
    ## rm      0.048069117 6.346703e-07  -2.68405122
    ## age     0.124421452 2.854869e-16   0.10778623
    ## dis     0.144149375 8.519949e-19  -1.55090168
    ## rad     0.391256687 2.693844e-56   0.61791093
    ## tax     0.339614243 2.357127e-47   0.02974225
    ## ptratio 0.084068439 2.942922e-11   1.15198279
    ## black   0.148274239 2.487274e-19  -0.03627964
    ## lstat   0.207590933 2.654277e-27   0.54880478
    ## medv    0.150780469 1.173987e-19  -0.36315992

From the table above it is clear that based on the p-values of
individual predictors, all predictors seem to have an impact on the
crime rate. If we are to use the R-squared values, then "rad", "tax" &
"lstat", in that order, "explain" the crime rate. Additionally, "indus",
"nox", "dis", "medv", "lstat" and "black" probably have a significant
correlation to the crime rate.

![](Q15_Solution_files/figure-markdown_strict/15-a-ii-1.png)

15.b
====

    linear_fit_all = lm(crim~., data=Boston)
    summary_fit_all = summary(linear_fit_all)
    summary_fit_all

    ## 
    ## Call:
    ## lm(formula = crim ~ ., data = Boston)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -9.924 -2.120 -0.353  1.019 75.051 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  17.033228   7.234903   2.354 0.018949 *  
    ## zn            0.044855   0.018734   2.394 0.017025 *  
    ## indus        -0.063855   0.083407  -0.766 0.444294    
    ## chas         -0.749134   1.180147  -0.635 0.525867    
    ## nox         -10.313535   5.275536  -1.955 0.051152 .  
    ## rm            0.430131   0.612830   0.702 0.483089    
    ## age           0.001452   0.017925   0.081 0.935488    
    ## dis          -0.987176   0.281817  -3.503 0.000502 ***
    ## rad           0.588209   0.088049   6.680 6.46e-11 ***
    ## tax          -0.003780   0.005156  -0.733 0.463793    
    ## ptratio      -0.271081   0.186450  -1.454 0.146611    
    ## black        -0.007538   0.003673  -2.052 0.040702 *  
    ## lstat         0.126211   0.075725   1.667 0.096208 .  
    ## medv         -0.198887   0.060516  -3.287 0.001087 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 6.439 on 492 degrees of freedom
    ## Multiple R-squared:  0.454,  Adjusted R-squared:  0.4396 
    ## F-statistic: 31.47 on 13 and 492 DF,  p-value: < 2.2e-16

The summary results indicate that the predictors "dis" and "rad" have
siginificant association to the response, followed by "medv". There
might be some association for "zn", "nox", "lstat" and "black" to the
response. For these 7 predictors I would reject the null hypothesis
beta-j=0.

Running the multivariate linear regression again but removing the
predictors with no association to the response gives:

    linear_fit_all_2 = lm(crim~.-indus-chas-rm-age-tax-ptratio, data=Boston)
    summary_fit_all_2 = summary(linear_fit_all_2)
    summary_fit_all_2

    ## 
    ## Call:
    ## lm(formula = crim ~ . - indus - chas - rm - age - tax - ptratio, 
    ##     data = Boston)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -10.058  -1.962  -0.274   0.946  75.986 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  11.926502   4.027489   2.961 0.003210 ** 
    ## zn            0.051641   0.017324   2.981 0.003016 ** 
    ## nox         -10.047986   4.493821  -2.236 0.025797 *  
    ## dis          -0.888085   0.261819  -3.392 0.000749 ***
    ## rad           0.493381   0.044112  11.185  < 2e-16 ***
    ## black        -0.008481   0.003607  -2.351 0.019106 *  
    ## lstat         0.118504   0.069175   1.713 0.087317 .  
    ## medv         -0.139436   0.050045  -2.786 0.005537 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 6.44 on 498 degrees of freedom
    ## Multiple R-squared:  0.4473, Adjusted R-squared:  0.4395 
    ## F-statistic: 57.57 on 7 and 498 DF,  p-value: < 2.2e-16

The summary indicate that "lstat" is the predictor with least
significance (p-value ~ 0.1). We therefore decided to check if the
second order of "lstat" has a correleation to the response

    linear_fit_all_3 = update(linear_fit_all_2, ~.+I(lstat^2))
    summary_fit_all_3 = summary(linear_fit_all_3)
    summary_fit_all_3

    ## 
    ## Call:
    ## lm(formula = crim ~ zn + nox + dis + rad + black + lstat + medv + 
    ##     I(lstat^2), data = Boston)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -9.169 -1.775 -0.392  1.090 76.229 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 20.461012   4.332714   4.722 3.04e-06 ***
    ## zn           0.037858   0.017207   2.200 0.028257 *  
    ## nox         -8.841580   4.406820  -2.006 0.045361 *  
    ## dis         -0.944929   0.256603  -3.682 0.000256 ***
    ## rad          0.490886   0.043189  11.366  < 2e-16 ***
    ## black       -0.007783   0.003535  -2.202 0.028122 *  
    ## lstat       -0.788847   0.202594  -3.894 0.000112 ***
    ## medv        -0.256630   0.054852  -4.679 3.73e-06 ***
    ## I(lstat^2)   0.024006   0.005052   4.752 2.64e-06 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 6.304 on 497 degrees of freedom
    ## Multiple R-squared:  0.4713, Adjusted R-squared:  0.4628 
    ## F-statistic: 55.38 on 8 and 497 DF,  p-value: < 2.2e-16

The summary statistics indicates that "lstat"'s second order has a
significant association with the response.

15.c
====

Comparing results of 15.a and 15.b by plotting coefficients of
individual predictors

    comparison_df = data.frame(univar_coeff = summary_df$coefficients, multivar_coeff = summary_fit_all$coefficients[2:14], row.names = row_names)
    comparison_df

    ##         univar_coeff multivar_coeff
    ## zn       -0.07393498    0.044855215
    ## indus     0.50977633   -0.063854824
    ## chas     -1.89277655   -0.749133611
    ## nox      31.24853120  -10.313534912
    ## rm       -2.68405122    0.430130506
    ## age       0.10778623    0.001451643
    ## dis      -1.55090168   -0.987175726
    ## rad       0.61791093    0.588208591
    ## tax       0.02974225   -0.003780016
    ## ptratio   1.15198279   -0.271080558
    ## black    -0.03627964   -0.007537505
    ## lstat     0.54880478    0.126211376
    ## medv     -0.36315992   -0.198886821

    comparison_df %>% ggplot(aes(univar_coeff, multivar_coeff, col=row_names))+ geom_point(position="jitter")+ geom_text(aes(label=row_names))

![](Q15_Solution_files/figure-markdown_strict/15-c-i-1.png)

15.d
====

    linear_fit_zn_a = lm(crim~poly(zn,3), data=Boston)
    summary_zn_a = summary(linear_fit_zn_a)

    linear_fit_indus_a = lm(crim~poly(indus,3), data=Boston)
    summary_indus_a = summary(linear_fit_indus_a)

    linear_fit_chas_a = lm(crim~poly(chas,1), data=Boston)
    summary_chas_a = summary(linear_fit_chas_a)

    linear_fit_nox_a = lm(crim~poly(nox,3), data=Boston)
    summary_nox_a = summary(linear_fit_nox_a)

    linear_fit_rm_a = lm(crim~poly(rm,3), data=Boston)
    summary_rm_a = summary(linear_fit_rm_a)

    linear_fit_age_a = lm(crim~poly(age,3), data=Boston)
    summary_age_a = summary(linear_fit_age_a)

    linear_fit_dis_a = lm(crim~poly(dis,3), data=Boston)
    summary_dis_a = summary(linear_fit_dis_a)

    linear_fit_rad_a = lm(crim~poly(rad,3), data=Boston)
    summary_rad_a = summary(linear_fit_rad_a)

    linear_fit_tax_a = lm(crim~poly(tax,3), data=Boston)
    summary_tax_a = summary(linear_fit_tax_a)

    linear_fit_ptratio_a = lm(crim~poly(ptratio,3), data=Boston)
    summary_ptratio_a = summary(linear_fit_ptratio_a)

    linear_fit_black_a = lm(crim~poly(black,3), data=Boston)
    summary_black_a = summary(linear_fit_black_a)

    linear_fit_lstat_a = lm(crim~poly(lstat,3), data=Boston)
    summary_lstat_a = summary(linear_fit_lstat_a)

    linear_fit_medv_a = lm(crim~poly(medv,3), data=Boston)
    summary_medv_a = summary(linear_fit_medv_a)

    compare_df = summary_df
    compare_df$coefficients=NULL
    compare_df$P_value=NULL


    compare_df=setNames(compare_df, c("LA_Rsq"))
    compare_df$NLA_Rsq = c(summary_zn_a$r.squared, summary_indus_a$r.squared, summary_chas_a$r.squared, summary_nox_a$r.squared, summary_rm_a$r.squared, summary_age_a$r.squared, summary_dis_a$r.squared, summary_rad_a$r.squared, summary_tax_a$r.squared, summary_ptratio_a$r.squared, summary_black_a$r.squared, summary_lstat_a$r.squared, summary_medv_a$r.squared)

    compare_df = compare_df %>% mutate(Rsq_improvement=(NLA_Rsq/LA_Rsq-1)*100)
    compare_df = data.frame(compare_df, row.names=row_names)
    compare_df

    ##              LA_Rsq     NLA_Rsq Rsq_improvement
    ## zn      0.040187908 0.058241974       44.924125
    ## indus   0.165310070 0.259657858       57.073224
    ## chas    0.003123869 0.003123869        0.000000
    ## nox     0.177217182 0.296977896       67.578500
    ## rm      0.048069117 0.067786061       41.017905
    ## age     0.124421452 0.174230994       40.032921
    ## dis     0.144149375 0.277824773       92.733942
    ## rad     0.391256687 0.400036872        2.244098
    ## tax     0.339614243 0.368882080        8.617965
    ## ptratio 0.084068439 0.113781577       35.343987
    ## black   0.148274239 0.149839829        1.055874
    ## lstat   0.207590933 0.217932432        4.981672
    ## medv    0.150780469 0.420200257      178.683479

For a number of factors, the R-squared value shows significant
improvement when non-linear terms are used and therefore might provide
evidence of non-linear association between the predictor and response.
However, one needs to be careful that this "association" does not in
reality describe an over-fitted model and also remember that each
predictor is being used independantly of others and may therefore
display an association that may not exist in a multivariate linear
regression model.
