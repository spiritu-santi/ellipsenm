% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all_classes.R
\docType{class}
\name{overlap_ellipsoid}
\alias{overlap_ellipsoid}
\alias{overlap_ellipsoid-class}
\title{An S4 class to organize data and results of overlap_ellipsoid objects}
\description{
An S4 class to organize data and results of overlap_ellipsoid objects
}
\section{Slots}{

\describe{
\item{\code{ellipsoids}}{list of objects of class ellipsoid.}

\item{\code{data}}{list of data.frames with the data used for analyses.}

\item{\code{variable_names}}{("character")}

\item{\code{full_background}}{list of matrices representing background for full
overlap.}

\item{\code{full_overlap}}{a data.frame of overlap results considering full background.}

\item{\code{union_background}}{list of matrices representing background for union
overlap.}

\item{\code{union_overlap}}{data.frame of overlap results considering union background.}

\item{\code{significance_results}}{list of all overlap results resulted from
significance random tests.}
}}

\examples{
showClass("overlap_ellipsoid")
}
