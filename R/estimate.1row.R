#' Impute one row of data
#'
#' @param row A vector
#' @param s Covariance matrix
#' @param m Mean vector
#' @return A list with the estimated mean and variance for the data
estimate.1row = function(row, s, m){
  miss_col = is.na(row)
  nmiss = sum(miss_col)
  if(nmiss>0){
    mu.miss = m[miss_col]
    mu.obs = m[!miss_col]
    sigma.miss = s[miss_col,miss_col]
    sigma.miss.obs = to_matrix(s[miss_col,!miss_col], horiz=nmiss==1)
    sigma.obs = s[!miss_col,!miss_col]
    mu_cond = mu.miss + sigma.miss.obs %*% solve(sigma.obs) %*% (row[!miss_col] - mu.obs)
    #sigma_cond = sigma.miss - sigma.miss.obs %*% solve(sigma.obs) %*% t(sigma.miss.obs)

    # row[miss_col] = rmvnorm(1, mean=mu_cond, sigma=sigma_cond)
    row[miss_col] = mu_cond
  }
  return(row)
}
