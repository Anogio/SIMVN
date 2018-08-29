#' Estimate data mean and variance for imputation
#'
#' norm::rngseed MUST be run before the function is used, otherwise it will not work
#' @param X A data matrix.
#' @param verbose A boolean: whether or not to print EM iterations
#' @return A list with the estimated mean and variance for the data
SIMVN_train = function(X, verbose=F){
  # Must run *rngseed* at least once before using
  pre <- prelim.norm2(as.matrix(X))
  thetahat <- norm::em.norm(pre, showits=verbose)
  params = norm::getparam.norm(pre,thetahat)
  return(params)
}
