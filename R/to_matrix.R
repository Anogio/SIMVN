#' Converts a dataframe or vector to matrix of the right orientation, handling the case where the data is 1D
#'
#' @param x a dataframe or vector
#' @param horiz Wheter the returned matrix should be a row matrix
#' @return \code{X} filled with estimated values
to_matrix = function(x, horiz){
  if(!is.null(dim(x))){
    return(x)
  }
  else{
    if(!horiz){
      return(as.matrix(x))
    }
    else{
      return(t(as.matrix(x)))
    }
  }
}
