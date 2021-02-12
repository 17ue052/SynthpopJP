#'return the data
#'
#'@param n number of records
#'
#'
#'@return dataframe
#'@description
#'
#'
#'@export
mkdata <- function(n){
  z <- stats::rmultinom(n, 1, pop$V1)
  z <- t(z)
  as.data.frame(z) -> z
  z %>% dplyr::mutate(id = dplyr::row_number()) -> z
  colnames(z) <- c(as.character(15:109),"id")
  z %>% tidyr::pivot_longer(`15`:`109`, names_to = "年齢", values_to = "value") %>%
    dplyr::filter(value == 1) %>%
    dplyr::select(`年齢`) -> z
  as.data.frame(z) %>%
    dplyr::mutate(`年齢` = as.numeric(`年齢`))-> z
  z %>%
    dplyr::mutate(`乱数` = stats::runif(n)) %>%
    dplyr::mutate(`性別` = dplyr::if_else(`乱数` <= 0.4832773, "男", "女")) %>%
    dplyr::select(-`乱数`) -> z

  return(z)
}
