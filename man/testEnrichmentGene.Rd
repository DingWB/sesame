% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kyCG.R
\name{testEnrichmentGene}
\alias{testEnrichmentGene}
\title{testEnrichmentGene tests for the enrichment of set of probes
(querySet) in gene regions.}
\usage{
testEnrichmentGene(querySet, databaseSets = NA, platform = NA, verbose = FALSE)
}
\arguments{
\item{querySet}{Vector of probes of interest (e.g., probes belonging to a
given platform)}

\item{databaseSets}{List of vectors corresponding to the database sets of
interest with associated meta data as an attribute to each element. Optional.
(Default: NA)}

\item{platform}{String corresponding to the type of platform to use. Either
MM285, EPIC, HM450, or HM27. If it is not provided, it will be inferred
from the query set querySet (Default: NA)}

\item{verbose}{Logical value indicating whether to display intermediate
text output about the type of test. Optional. (Default: FALSE)}
}
\value{
One list containing features corresponding the test estimate,
p-value, and type of test.
}
\description{
testEnrichmentGene tests for the enrichment of set of probes
(querySet) in gene regions.
}
\examples{
library(SummarizedExperiment)
MM285.tissueSignature = sesameDataGet('MM285.tissueSignature')
df = rowData(MM285.tissueSignature)
querySet = df$Probe_ID[df$branch == "E-Brain"]
testEnrichmentGene(querySet, platform="MM285", verbose=FALSE)

}
