#' Impute missing data by the conditional mean of the observed values, using a normal approximation
#'
#' @param fittedM A parameter list as returned by SIMVN_train
#' @param X A data matrix
#' @return \code{X} filled with estimated values
#' @export SIMVN_impute
SIMVN_impute = function(fittedM, X){
  #print(dim(X))
  #thetahat <- em.norm(pre)
  sigma = fittedM$sigma
  mu = fittedM$mu
  X = t(apply(X, 1, purrr::partial(estimate.1row, s=sigma, m=mu)))
  #print(dim(X))
  #print('')
  return(X)
}
