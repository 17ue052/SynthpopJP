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
    select(V) -> JPdata2

  syn(data = JPdata2, k=n) -> synJP_list
  synJP_list$syn %>%
    mutate(sample_n(myoji, nrow(dff))) %>%
    mutate(sample_n(onna_namae, nrow(dff))) %>%
    mutate(sample_n(otoko_namae, nrow(dff))) %>%
    mutate(名 = if_else(性別 == "男", `男名`, `女名`)) %>%
    mutate(メイ = if_else(性別 == "男", `男メイ`, `女メイ`)) %>%
    select(-c(女名,男名,女メイ,男メイ)) -> synJP_df

  return(synJP_df)
}

