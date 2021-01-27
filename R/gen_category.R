#'return one of the data
#'
#'@param V1
#'@param ref
#'@param V1_vname
#'
#'
#'
#'@return character
#'@description
#'
#'@export
gen_category <- function(V1, ref, V1_vname){

  V1_vname <- rlang::sym(V1_vname)

  ref %>%
    dplyr::filter(!!(V1_vname) == V1) %>%
    dplyr::select(-!!(V1_vname)) %>%
    t() %>% as.vector() -> rate

  ref %>%
    dplyr::select(-!!(V1_vname)) %>%
    colnames() -> cate

  cate[which(as.logical(as.vector(stats::rmultinom(1, 1, rate))))]

}
