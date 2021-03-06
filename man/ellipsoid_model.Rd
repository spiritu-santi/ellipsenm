% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ellipsoid_model.R
\name{ellipsoid_model}
\alias{ellipsoid_model}
\title{Ellipsoid-based ecological niche models}
\usage{
ellipsoid_model(data, species, longitude, latitude, raster_layers,
                method = "covmat", level = 95, truncate = TRUE, replicates = 1,
                replicate_type = "bootstrap", bootstrap_percentage = 75,
                projection_variables = NULL, prvariables_format = NULL,
                prediction = "suitability", return_numeric = TRUE,
                tolerance = 1e-60, format = "GTiff",
                overwrite = FALSE, color_palette = viridis::magma,
                output_directory = "ellipsenm_model")
}
\arguments{
\item{data}{data.frame of occurrence records. Columns must be: species,
longitude, and latitude. Optionally, if \code{raster_layers} is not defined,
\code{data} must include more columns containing the values of at least two
variables to be used for fitting ellipsoid* models.}

\item{species}{(character) name of the column with the name of the species.}

\item{longitude}{(character) name of the column with longitude data.}

\item{latitude}{(character) name of the column with latitude data.}

\item{raster_layers}{RasterStack of at least two environmental variables to be
extracted using geographic coordinates present in \code{data}. If not provided
data must include additional columns containing values of variables to fit
ellipsoid* models.}

\item{method}{(character) method to construct the ellipsoid that characterizes
the species ecological niche. Available methods are: "covmat", "mve1", and
"mve2". See details of \code{\link{ellipsoid_fit}}. Default = "covmat".}

\item{level}{(numeric) the confidence level of a pairwise confidence region
for the ellipsoid, expresed as percentage. Default = 95.}

\item{truncate}{(logical) whether or not to truncate values of suitability
based on ellipsoid limits. All values outside the ellipsoid will be zero.
Default = TRUE.}

\item{replicates}{(numeric) number of replicates to perform. Default = 1
produces a single model using all the data.}

\item{replicate_type}{(character) type of replicates to perform. Options are:
"bootstrap" and "jackknife"; default = "bootstrap". See details. Ignored if
\code{replicates} = 1.}

\item{bootstrap_percentage}{(numeric) percentage of data to be bootstrapped
for each replicate. Default = 50. Valid if \code{replicates} > 1 and
\code{replicate_type} = "bootstrap".}

\item{projection_variables}{optional, (RasterStack, list, or character): if
RasterStack, a stack of layers respresenting an only scenario for projection;
if list, a named list of RasterStacks representing multiple scenarios for
projection; if character, name of the folder (in the working directory)
containing other folders (scenarios for projection) with raster layers to be
used as variables. See details. Default = NULL.}

\item{prvariables_format}{(character) if \code{projection_variables} is a list,
raster type of variables (raster layers) to be used and located in
subdirectories. Default = NULL. See \code{\link[raster]{writeFormats}} for
details and options.}

\item{prediction}{(character) type of prediction to be made, options are:
"suitability", "mahalanobis", and "both". Default = "suitability".}

\item{return_numeric}{(logical) whether or not to return values of mahalanobis
distance and suitability as part of the results (it depends on the type of
\code{prediction} selected). Default = FALSE.}

\item{tolerance}{the tolerance for detecting linear dependencies.
Default = 1e-60.}

\item{format}{(charater) file type for raster outputs to be written in
\code{output_directory}. Default = "GTiff". See \code{\link[raster]{writeFormats}}.}

\item{overwrite}{(logical) whether or not to overwrite exitent results in
\code{output_directory}. Default = FALSE.}

\item{color_palette}{a color palette function to be used in plotting
suitability values in an HTML report produced at the end of all analyses.}

\item{output_directory}{name of the folder were all results will be written.
This avoids saturation of the RAM.}
}
\value{
An object of class \code{\link{ellipsoid_model_sim}} or
\code{\link{ellipsoid_model_rep}}.
}
\description{
ellipsoid_model helps in finding the centroid and matrix that
define an ellipsoid. It uses distinct methods with asumptions that differ
from each other.
}
\details{
\code{replicate_type}

\code{projection_variables}
}
\examples{
# reading data
occurrences <- read.csv(system.file("extdata", "occurrences.csv",
                                    package = "ellipsenm"))

# raster layers of environmental data
vars <- raster::stack(list.files(system.file("extdata", package = "ellipsenm"),
                                 pattern = "bio", full.names = TRUE))

# creating the model with no replicates
ell_model <- ellipsoid_model(data = occurrences, species = "species",
                             longitude = "longitude", latitude = "latitude",
                             raster_layers = vars, method = "covmat", level = 99,
                             replicates = 1, prediction = "suitability",
                             return_numeric = TRUE, format = "GTiff",
                             overwrite = FALSE, output_directory = "ellipsenm_model")

class(ell_model)
# check your directory, folder "ellipsenm_model"

# creating the model with replicates
ell_model1 <- ellipsoid_model(data = occurrences, species = "species",
                              longitude = "longitude", latitude = "latitude",
                              raster_layers = vars, method = "covmat", level = 99,
                              replicates = 5, prediction = "suitability",
                              return_numeric = TRUE, format = "GTiff",
                              overwrite = FALSE, output_directory = "ellipsenm_model1")

class(ell_model1)
# check your directory, folder "ellipsenm_model1"

# creating the model with projections
pr_vars <- raster::stack(system.file("extdata", "proj_variables.tif",
                                     package = "ellipsenm"))
names(pr_vars) <- names(vars)

ell_model2 <- ellipsoid_model(data = occurrences, species = "species",
                              longitude = "longitude", latitude = "latitude",
                              raster_layers = vars, method = "covmat", level = 99,
                              replicates = 3, replicate_type = "bootstrap",
                              bootstrap_percentage = 75, projection_variables = pr_vars,
                              prediction = "suitability", return_numeric = TRUE,
                              format = "GTiff", overwrite = FALSE,
                              output_directory = "ellipsenm_model2")

class(ell_model2)
# check your directory, folder "ellipsenm_model2"
}
