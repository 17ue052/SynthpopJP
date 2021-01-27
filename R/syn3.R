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
    dplyr::select(V) -> JPdata2

  synthpop::syn(data = JPdata2, k=n) -> synJP_list
  synJP_list$syn %>%
    dplyr::mutate(dplyr::sample_n(myoji, n())) %>%
    dplyr::mutate(dplyr::sample_n(onna_namae, n())) %>%
    dplyr::mutate(dplyr::sample_n(otoko_namae, n())) %>%
    dplyr::mutate(`名` = dplyr::if_else(.data$`性別` == "男", .data$`男名`, .data$`女名`)) %>%
    dplyr::mutate(`メイ` = dplyr::if_else(.data$`性別` == "男", .data$`男メイ`, .data$`女メイ`)) %>%
    dplyr::select(-c(.data$`女名`, .data$`男名`, .data$`女メイ`, .data$`男メイ`)) -> synJP_df

  return(synJP_df)
}

