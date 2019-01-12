    knitr::opts_chunk$set(echo = TRUE)
    library(e1071)
    library(ISLR)
    library(dplyr)
    attach(OJ)

### 8.a

    set.seed(1970)
    train = sample(nrow(OJ), 800)
    OJ = mutate(OJ, StoreID = as.factor(StoreID), SpecialCH = as.factor(SpecialCH), SpecialMM = as.factor(SpecialMM), STORE = as.factor(STORE))

### 8.b

    svmfit = svm(Purchase~.-WeekofPurchase, data = OJ[train,], kernel = "linear", cost = 0.01, scale = TRUE)
    summary(svmfit)

    ## 
    ## Call:
    ## svm(formula = Purchase ~ . - WeekofPurchase, data = OJ[train, 
    ##     ], kernel = "linear", cost = 0.01, scale = TRUE)
    ## 
    ## 
    ## Parameters:
    ##    SVM-Type:  C-classification 
    ##  SVM-Kernel:  linear 
    ##        cost:  0.01 
    ##       gamma:  0.04347826 
    ## 
    ## Number of Support Vectors:  433
    ## 
    ##  ( 218 215 )
    ## 
    ## 
    ## Number of Classes:  2 
    ## 
    ## Levels: 
    ##  CH MM

A Support Vector Classifier was fitted to the training data and it used
433 observations as support vectors. This number represents over 50% of
all training observations.

### 8.c

    x = table(pred = svmfit$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for SVC = 0.1562"

    x = table(pred = predict(svmfit, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error SVC = 0.1741"

### 8.d

    tune.out = tune(svm, Purchase~.-WeekofPurchase, data = OJ[train,], kernel = "linear", scale = TRUE,
                    ranges = list(cost = c(0.01, 0.1, 1, 2, 5, 10)))
    print(paste("The optimal cost for the SVC =", tune.out$best.model$cost))

    ## [1] "The optimal cost for the SVC = 10"

### 8.e

    x = table(pred = tune.out$best.model$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for the optimal SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for the optimal SVC = 0.1525"

    x = table(pred = predict(tune.out$best.model, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for the optimal SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for the optimal SVC = 0.1741"

### 8.f

    svmfit = svm(Purchase~.-WeekofPurchase, data = OJ[train,], kernel = "radial", cost = 0.01, scale = TRUE)

    x = table(pred = svmfit$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for SVM with radial kernel = 0.4012"

    x = table(pred = predict(svmfit, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for SVM with radial kernel = 0.3556"

    tune.out = tune(svm, Purchase~.-WeekofPurchase, data = OJ[train,], kernel = "radial",
                    ranges = list(cost = c(0.01, 0.1, 1, 2, 5, 10)))
    print(paste("The optimal cost for SVM with radial kernel =", tune.out$best.model$cost))

    ## [1] "The optimal cost for SVM with radial kernel = 0.1"

    x = table(pred = tune.out$best.model$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for the optimal SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for the optimal SVM with radial kernel = 0.1588"

    x = table(pred = predict(tune.out$best.model, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for the optimal SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for the optimal SVM with radial kernel = 0.1889"

### 8.g

    svmfit = svm(Purchase~.-WeekofPurchase, data = OJ[train,], kernel = "polynomial", cost = 0.01, degree = 2, scale = TRUE)

    x = table(pred = svmfit$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for SVM with polynomial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for SVM with polynomial kernel = 0.4012"

    x = table(pred = predict(svmfit, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for polynomial kernel fit =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for polynomial kernel fit = 0.3556"

    tune.out = tune(svm, Purchase~.-WeekofPurchase, data = OJ[train,], kernel = "polynomial", degree = 2,
                    ranges = list(cost = c(0.01, 0.1, 1, 2, 5, 10)))
    print(paste("The optimal cost for SVM with polynomial kernel =", tune.out$best.model$cost))

    ## [1] "The optimal cost for SVM with polynomial kernel = 10"

    x = table(pred = tune.out$best.model$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for the optimal SVM with polynomial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for the optimal SVM with polynomial kernel = 0.1562"

    x = table(pred = predict(tune.out$best.model, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for the optimal SVM with polynomial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for the optimal SVM with polynomial kernel = 0.1815"

### 8.h

Overall, the SVC with cost=0.01 gives the best result with a test error
rate of 17.41%.
