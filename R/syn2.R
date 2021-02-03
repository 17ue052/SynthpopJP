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
    dplyr::select(c("性別","年齢",V)) -> JPdata2

  synthpop::syn(data = JPdata2, k=n, visit.sequence = c("性別","年齢")) -> synJP_list
  pM.cor <- synJP_list$predictor.matrix
  pM.cor[c("性別","年齢"),] <- 1
  pM.cor[,c("性別","年齢")] <- 1
  synthpop::syn(data = JPdata2, k=500,predictor.matrix = pM.cor) -> synJP_list2
  synJP_list2$syn -> synJP_df

  return(synJP_df)
}

