    knitr::opts_chunk$set(echo = TRUE)
    library(e1071)
    library(ISLR)
    library(dplyr)
    attach(OJ)

### 8.a

    set.seed(1970)
    train = sample(nrow(OJ), 800)

### 8.b

    svmfit = svm(Purchase~., data = OJ[train,], kernel = "linear", cost = 0.01)
    summary(svmfit)

    ## 
    ## Call:
    ## svm(formula = Purchase ~ ., data = OJ[train, ], kernel = "linear", 
    ##     cost = 0.01)
    ## 
    ## 
    ## Parameters:
    ##    SVM-Type:  C-classification 
    ##  SVM-Kernel:  linear 
    ##        cost:  0.01 
    ##       gamma:  0.05555556 
    ## 
    ## Number of Support Vectors:  431
    ## 
    ##  ( 216 215 )
    ## 
    ## 
    ## Number of Classes:  2 
    ## 
    ## Levels: 
    ##  CH MM

A Support Vector Classifier was fitted to the training data and it used
431 observations as support vectors. This number represents over 50% of
all training observations.

### 8.c

    x = table(pred = svmfit$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for SVC = 0.155"

    x = table(pred = predict(svmfit, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error SVC = 0.1852"

### 8.d

    tune.out = tune(svm, Purchase~., data = OJ[train,], kernel = "linear",
                    ranges = list(cost = c(0.01, 0.1, 1, 2, 5, 10)))
    print(paste("The optimal cost for the SVC =", tune.out$best.model$cost))

    ## [1] "The optimal cost for the SVC = 0.1"

### 8.e

    x = table(pred = tune.out$best.model$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for the optimal SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for the optimal SVC = 0.1538"

    x = table(pred = predict(tune.out$best.model, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for the optimal SVC =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for the optimal SVC = 0.1963"

### 8.f

    svmfit = svm(Purchase~., data = OJ[train,], kernel = "radial", cost = 0.01)

    x = table(pred = svmfit$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for SVM with radial kernel = 0.4012"

    x = table(pred = predict(svmfit, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for SVM with radial kernel = 0.3556"

    tune.out = tune(svm, Purchase~., data = OJ[train,], kernel = "radial",
                    ranges = list(cost = c(0.01, 0.1, 1, 2, 5, 10)))
    print(paste("The optimal cost for SVM with radial kernel =", tune.out$best.model$cost))

    ## [1] "The optimal cost for SVM with radial kernel = 2"

    x = table(pred = tune.out$best.model$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for the optimal SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for the optimal SVM with radial kernel = 0.1338"

    x = table(pred = predict(tune.out$best.model, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for the optimal SVM with radial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for the optimal SVM with radial kernel = 0.1889"

### 8.g

    svmfit = svm(Purchase~., data = OJ[train,], kernel = "polynomial", cost = 0.01, degree = 2)

    x = table(pred = svmfit$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for SVM with polynomial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for SVM with polynomial kernel = 0.3838"

    x = table(pred = predict(svmfit, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for polynomial kernel fit =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for polynomial kernel fit = 0.3296"

    tune.out = tune(svm, Purchase~., data = OJ[train,], kernel = "polynomial", degree = 2,
                    ranges = list(cost = c(0.01, 0.1, 1, 2, 5, 10)))
    print(paste("The optimal cost for SVM with polynomial kernel =", tune.out$best.model$cost))

    ## [1] "The optimal cost for SVM with polynomial kernel = 10"

    x = table(pred = tune.out$best.model$fitted, truth = OJ$Purchase[train])
    print(paste("The training error for the optimal SVM with polynomial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The training error for the optimal SVM with polynomial kernel = 0.1388"

    x = table(pred = predict(tune.out$best.model, OJ[-train,]), truth = OJ$Purchase[-train])
    print(paste("The test error for the optimal SVM with polynomial kernel =", round(sum(x[row(x)!=col(x)])/sum(x),4)))

    ## [1] "The test error for the optimal SVM with polynomial kernel = 0.1852"

### 8.h

Overall, the SVM with a polynomial kernel with degree=2 and cost=10
gives the best result with a test error rate of 18.52%.

However, it must be noted that the SVM with radial kernel with
gamma=0.06 (default=1/ncol(OJ)) and cost=2 gives a comparable test error
rate of 18.89% and the SVC with cost=0.1 does not do too poorly with a
test error rate of 19.63%.
