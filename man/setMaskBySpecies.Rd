% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mask.R
\name{setMaskBySpecies}
\alias{setMaskBySpecies}
\title{Set mask using species-specific manifest}
\usage{
setMaskBySpecies(sdf, species = "homo_sapiens")
}
\arguments{
\item{sdf}{a \code{SigDF}}

\item{species}{the species the sample is considered to be}
}
\value{
a \code{SigDF} with updated color channel and mask
}
\description{
Set mask using species-specific manifest
}
\examples{
sdf = sesameDataGet('Mammal40.1.SigDF')
sdf_mouse = setMaskBySpecies(sdf, "mus_musculus")

}
