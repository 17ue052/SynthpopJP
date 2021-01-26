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
gen_cont <- function(V1,V2,ref,V1_vname,V2_vname){
  V1_vname <- rlang::sym(V1_vname)
  V2_vname <- rlang::sym(V2_vname)

  ref %>%
    filter(!!(V1_vname) == V1) %>%
    filter(!!(V2_vname) == V2) %>%
    select(-!!(V2_vname)) %>%
    select(-!!(V1_vname)) -> ave_SD
  as.numeric(ave_SD[1,1]) -> ave
  as.numeric(ave_SD[1,2]) -> SD

  round(rnorm(1,ave,SD),digits = 1)
}
