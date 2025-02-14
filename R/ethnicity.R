#' Infer Ethnicity
#'
#' This function uses both the built-in rsprobes as well as the type I
#' Color-Channel-Switching probes to infer ethnicity.
#'
#' s better be background subtracted and dyebias corrected for
#' best accuracy
#'
#' Please note: the betas should come from SigDF *without*
#' channel inference.
#'
#' @param sdf a \code{SigDF}
#' @return string of ethnicity
#' @importFrom randomForest randomForest
#' @import sesameData
#' @examples
#' sdf <- sesameDataGet('EPIC.1.SigDF')
#' inferEthnicity(sdf)
#' @export
inferEthnicity <- function(sdf) {

    stopifnot(is(sdf, 'SigDF'))
    stopifnot(sdfPlatform(sdf) %in% c('EPIC','HM450'))

    ethnicity.inference <- sesameDataGet('ethnicity.inference')
    ccsprobes <- ethnicity.inference$ccs.probes
    rsprobes <- ethnicity.inference$rs.probes
    ethnicity.model <- ethnicity.inference$model
    af <- c(
        getBetas(sdf, mask=FALSE)[rsprobes],
        getAFTypeIbySumAlleles(sdf, known.ccs.only = FALSE)[ccsprobes])

    as.character(predict(ethnicity.model, af))
}
