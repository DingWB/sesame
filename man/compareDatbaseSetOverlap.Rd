% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kyCG.R
\name{compareDatbaseSetOverlap}
\alias{compareDatbaseSetOverlap}
\title{compareDatbaseSetOverlap calculates the pariwise overlap between given list 
of database sets using a distance metric.}
\usage{
compareDatbaseSetOverlap(
  databaseSets = NA,
  metric = "Jaccard",
  verbose = FALSE
)
}
\arguments{
\item{databaseSets}{List of vectors corresponding to the database sets of
interest with associated meta data as an attribute to each element. Optional.
(Default: NA)}

\item{metric}{String representing the similarity metric to use. Optional.
(Default: "Jaccard").}

\item{verbose}{Logical value indicating whether to display intermediate
text output about the type of test. Optional. (Default: FALSE)}
}
\value{
An upper triangular matrix containing a metric (Jaccard) comparing
the pairwise distances between database sets.
}
\description{
compareDatbaseSetOverlap calculates the pariwise overlap between given list 
of database sets using a distance metric.
}
\examples{
databaseSetNames = c('KYCG.MM285.seqContextN.20210630')
databaseSets = do.call(c, lapply(databaseSetNames, sesameDataGet))
compareDatbaseSetOverlap(databaseSets)

}
