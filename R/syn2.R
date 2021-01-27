#'JPdata→synthpop→JPdata2(no name)
#'
#'@param V
#'@param n
#'
#'@return character
#'@description hoge
#'
#'@export
syn2 <- function(V,n){
  JPdata %>%
    dplyr::select(V) -> JPdata2

  synthpop::syn(data = JPdata2, k=n) -> synJP_list
  synJP_list$syn -> synJP_df

  return(synJP_df)
}

