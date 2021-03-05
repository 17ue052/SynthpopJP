#'Generate continuous variables based on two variables with mean and standard discrimination
#'
#'@param V1 first original variable of data to reference
#'@param V2 second original variable of data to reference
#'@param ref reference data name
#'@param V1_vname first reference variable
#'@param V2_vname second reference variable
#'
#'@return numeric
#'
#'
#'@export
gen_cont <- function(V1,V2,ref,V1_vname,V2_vname){
  V1_vname <- rlang::sym(V1_vname)
  V2_vname <- rlang::sym(V2_vname)

  ref %>%
    dplyr::filter(!!(V1_vname) == V1) %>%
    dplyr::filter(!!(V2_vname) == V2) %>%
    dplyr::select(-!!(V2_vname)) %>%
    dplyr::select(-!!(V1_vname)) -> ave_SD
  as.numeric(ave_SD[1,1]) -> ave
  as.numeric(ave_SD[1,2]) -> SD

  round(stats::rnorm(1,ave,SD),digits = 1)
}
