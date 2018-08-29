# SIMVN
Single imputation through multivariate normal imputation, with separate training and imputation

This R package was created in order to provide two separate functions for imputation 
(rather that one black-box function as in most implementations): one that estimates the imputation
parameters on some training data and another that can impute any new data.

Most of the code for parameter estimation comes directly from the *norm* package (https://cran.r-project.org/web/packages/norm/norm.pdf)
