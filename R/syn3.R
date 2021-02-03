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
  synJP_list$syn %>%
    dplyr::mutate(dplyr::sample_n(myoji, n)) %>%
    dplyr::mutate(dplyr::sample_n(onna_namae, n)) %>%
    dplyr::mutate(dplyr::sample_n(otoko_namae, n)) %>%
    dplyr::mutate(`名` = dplyr::if_else(`性別` == "男", `男名`, `女名`)) %>%
    dplyr::mutate(`メイ` = dplyr::if_else(`性別` == "男", `男メイ`, `女メイ`)) %>%
    dplyr::select(-c(`女名`,`男名`,`女メイ`,`男メイ`)) -> synJP_df

  return(synJP_df)
}

