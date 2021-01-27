#'return one of the data
#'
#'@param V1
#'@param V2
#'@param ref
#'@param V1_vname
#'@param V2_vname
#'
#'@return character
#'@description
#'
#'@export
gen_category2 <- function(V1, V2, ref, V1_vname, V2_vname){

  V1_vname <- rlang::sym(V1_vname)
  V2_vname <- rlang::sym(V2_vname)

  ref %>%
    dplyr::filter(!!(V1_vname) == V1) %>%
    dplyr::filter(!!(V2_vname) == V2) %>%
    dplyr::select(-!!(V2_vname)) %>%
    dplyr::select(-!!(V1_vname)) %>%
    t() %>% as.vector() -> rate

  ref %>%
    dplyr::select(-!!(V2_vname)) %>%
    dplyr::select(-!!(V1_vname)) %>%
    colnames() -> cate

  cate[which(as.logical(as.vector(stats::rmultinom(1, 1, rate))))]

}
