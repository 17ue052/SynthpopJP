#'return the data
#'
#'@param n
#'
#'
#'@return dataframe
#'@description
#'
#'@export
mkdata <- function(n){
  z <- rmultinom(n, 1, pop$V1)
  z <- t(z)
  as.data.frame(z) -> z
  z %>% mutate(id = row_number()) -> z
  colnames(z) <- c(as.character(15:109),"id")
  z %>% pivot_longer(`15`:`109`, names_to = "年齢", values_to = "value") %>%
    filter(value == 1) %>%
    select(年齢) -> z
  as.data.frame(z) %>%
    mutate(年齢 = as.numeric(年齢))-> z
  z %>%
    mutate(乱数 = runif(n)) %>%
    mutate(性別 = if_else(乱数 <= 0.4832773, "男", "女")) %>%
    select(-`乱数`) -> z

  return(z)
}
