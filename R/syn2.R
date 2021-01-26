#'JPdata→synthpop→JPdata2(no name)
#'
#'@param V
#'@param n
#'
#'@return character
#'@description
#'
#'@export
syn2 <- function(V,n){
  JPdata %>%
    select(V) -> JPdata2

  syn(data = JPdata2, k=n) -> synJP_list
  synJP_list$syn -> synJP_df

  return(synJP_df)
}

