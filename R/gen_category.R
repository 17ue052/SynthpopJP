#'Generate category variables based on one variable
#'
#'@param V1 the original variable of data to reference
#'@param ref reference data name
#'@param V1_vname the reference variable
#'
#'@return character
#'
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
