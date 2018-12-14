    knitr::opts_chunk$set(echo = TRUE)

### 7

    dsc = scale(USArrests)

    dist.euclid = dist(dsc)
    dist.corr = as.dist(1-cor(t(dsc)))

    mean(dist.euclid^2/dist.corr); sd(dist.euclid^2/dist.corr)

    ## [1] 35.72228

    ## [1] 367.8678

From the mean and sd of the ratio of dist.eculid^2 and dist.corr, I am
unable to see how they are to be considered proportionate.
