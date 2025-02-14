% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strain.R
\name{inferStrain}
\alias{inferStrain}
\title{Infer strain information for mouse array}
\usage{
inferStrain(betas, strain_snp_table = NULL)
}
\arguments{
\item{betas}{beta value vector from which VAFs are extracted}

\item{strain_snp_table}{if not given download the default from sesameData}
}
\value{
a list of best guess, p-value of the best guess
and the probabilities of all strains
}
\description{
Infer strain information for mouse array
}
\examples{
sesameDataCache("MM285") # if not done yet
sdf = sesameDataGet('MM285.1.SigDF')
betas = getBetas(dyeBiasNL(noob(sdf)))
inferStrain(betas)
}
