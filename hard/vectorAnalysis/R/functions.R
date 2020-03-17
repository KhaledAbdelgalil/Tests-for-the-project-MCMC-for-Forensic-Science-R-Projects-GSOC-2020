#' smallest
#'
#' function to get minumum element in R vector.
#' @param input input vector
#'
#' @return minumum number
#' @export
#'
#' @examples
#' v=c(10,50,5,3)
#' smallest(v)
#'
#' 3
smallest<- function(input){
  res<- min_in_vector(input)
  res
}

#' largest
#'
#' function to get maximum element in R vector.
#' @param input input vector
#'
#' @return maximum number
#' @export
#'
#' @examples
#' v=c(10,50,5,3)
#' smallest(v)
#'
#' 50
largest<- function(input){
  res<- max_in_vector(input)
  res
}

#' get_outliers
#'
#' function to get outliers in a vector
#' @param data input vector
#'
#' @return outliers in a vector
#' @export
#'
#' @examples
#'
get_outliers <-function(data){
  outliers<-get_outliers_vector(data)
  if(length(outliers))
    outliers
  else "No outliers"
}




#' remove_outliers
#'
#' function to remove outliers from a vector
#' @param data input vector
#'
#' @return vector without outliers
#' @export
#'
#' @examples
#'
remove_outliers <-function(data){
  res<-remove_outliers_vector(data)
  res
}

#' normalize_min_max
#'
#'function to normalize data between some range(newMin,newMax)
#' @param data input vector
#' @param newMin_newMax vector contains 2 values only newMin and newMax which is your new range to normalize data
#'
#' @return normalized vector
#' @export
#'
#' @examples
normalize_min_max <-function(data,newMin_newMax)
{
  res<-min_max_normalize(data,newMin_newMax)
  res
}

#' normalize_z_score
#'
#'function to normalize vector according to z-score
#' @param data input vector
#'
#' @return normalized vector
#' @export
#'
#' @examples
normalize_z_score <-function(data)
{
  res<-z_score_normalize(data)
  res
}



#' normalize_decimal
#'
#'function to normalize vector according to largest number digits newNumber=oldNumber/10^digits where digits is largest number digits
#
#' @param data input vector
#'
#' @return normalized vector
#' @export
#'
#' @examples
normalize_decimal <-function(data)
{
  res<-decimal_normalize(data)
  res
}
