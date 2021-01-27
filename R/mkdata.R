#'return the data
#'
#'@param n
#'
#'
#'@return dataframe
#'@description
#'
#'@importFrom rlang .data
#'@export
mkdata <- function(n){
  z <- stats::rmultinom(n, 1, pop$V1)
  z <- t(z)
  as.data.frame(z) -> z
  z %>% dplyr::mutate(id = dplyr::row_number()) -> z
  age_range <- 15:109
  colnames(z) <- c(as.character(age_range), "id")
  z %>% tidyr::pivot_longer(-.data$`id`, names_to = "年齢", values_to = "value") %>%
    dplyr::filter(.data$value == 1) %>%
    dplyr::select(.data$`年齢`) -> z
  as.data.frame(z) %>%
    dplyr::mutate(`年齢` = as.numeric(.data$`年齢`))-> z
  z %>%
    dplyr::mutate(`乱数` = stats::runif(n)) %>%
    dplyr::mutate(`性別` = dplyr::if_else(.data$`乱数` <= 0.4832773, "男", "女")) %>%
    dplyr::select(-.data$`乱数`) -> z

  return(z)
}
