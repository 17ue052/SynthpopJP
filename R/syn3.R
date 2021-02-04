#'JPdata→synthpop→JPdata2(include name)
#'
#'@param V
#'@param n
#'
#'@return character
#'@description
#'
#'@export
syn3 <- function(V,n){
  JPdata %>%
    dplyr::select(c("性別","年齢",V)) -> JPdata2

  synthpop::syn(data = JPdata2, k=n, visit.sequence = c("性別","年齢")) -> synJP_list
  pM.cor <- synJP_list$predictor.matrix
  pM.cor[c("性別","年齢"),] <- 1
  pM.cor[,c("性別","年齢")] <- 1
  synthpop::syn(data = JPdata2, k=n,predictor.matrix = pM.cor) -> synJP_list2
  synJP_list2$syn %>%
    dplyr::mutate(dplyr::sample_n(myoji, n)) %>%
    dplyr::mutate(dplyr::sample_n(onna_namae, n)) %>%
    dplyr::mutate(dplyr::sample_n(otoko_namae, n)) %>%
    dplyr::mutate(`名` = dplyr::if_else(`性別` == "男", `男名`, `女名`)) %>%
    dplyr::mutate(`めい` = dplyr::if_else(`性別` == "男", `男めい`, `女めい`)) %>%
    dplyr::select(-c(`女名`,`男名`,`女めい`,`男めい`)) -> synJP_df
  colnames(synJP_df) -> JPcol
  JPdata <- if(("bmi" %in% JPcol)&&("体重" %in% JPcol)&&("身長" %in% JPcol)){
    synJP_df %>%
      mutate(bmi = round(((`体重`*100/`身長`)*100/`身長`), digits = 1))
  }else{
    synJP_df
  }

  return(JPdata)
}

