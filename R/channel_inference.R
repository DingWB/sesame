#' Infer and reset color channel for Type-I probes instead of
#' using what is specified in manifest. The results are stored to
#' sdf@extra$IGG and sdf@extra$IRR slot.
#'
#' IGG => Type-I green that is inferred to be green
#' IRR => Type-I red that is inferred to be red 
#' 
#' @param sdf a \code{SigDF}
#' @param verbose whether to print correction summary
#' @param switch_failed whether to switch failed probes (default to FALSE)
#' @param summary return summarized numbers only.
#' @importFrom matrixStats rowMaxs
#' @importFrom matrixStats rowMins
#' @return a \code{SigDF}, or numerics if summary == TRUE
#' @examples
#'
#' sdf <- sesameDataGet('EPIC.1.SigDF')
#' inferInfiniumIChannel(sdf)
#' 
#' @export
inferInfiniumIChannel <- function(
    sdf, switch_failed = FALSE, verbose = FALSE, summary = FALSE) {
    
    inf1_idx = which(sdf$col != "2")
    sdf1 = sdf[inf1_idx,]
    red_max = pmax(sdf1$MR, sdf1$UR)
    grn_max = pmax(sdf1$MG, sdf1$UG)
    new_col = factor(ifelse(
        red_max > grn_max, "R", "G"), levels=c("G","R","2"))
    d1R = sdf1[new_col == "R",]
    d1G = sdf1[new_col == "G",]
    bg_max = quantile(c(d1R$MG,d1R$UG,d1G$MR,d1G$UR), 0.95, na.rm=TRUE)

    ## revert to the original for failed probes if so desire
    if (!switch_failed) {
        idx = pmax(red_max, grn_max) < bg_max
        new_col[idx] = sdf1$col[idx]
    }
    sdf$col[inf1_idx] = factor(new_col, levels=c("G","R","2"))

    smry = c(
        R2R = sum(sdf1$col == "R" & new_col == "R"),
        G2G = sum(sdf1$col == "G" & new_col == "G"),
        R2G = sum(sdf1$col == "R" & new_col == "G"),
        G2R = sum(sdf1$col == "G" & new_col == "R"))
    
    if (summary) { return(smry) }

    if (verbose) {
        message(
            'Infinium-I color channel reset:\n',
            'R>R: ', smry['R2R'], '\n',
            'G>G: ', smry['G2G'], '\n',
            'R>G: ', smry['R2G'], '\n',
            'G>R: ', smry['G2R'], '\n')
    }

    sdf
}

