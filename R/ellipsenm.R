#' ellipsenm: An R package for ecological niche's characterization using ellipsoids
#'
#' ellipsenm implements multiple tools to help users in using ellipsoids to model
#' ecological niches of species. Handly options for calibrating and selecting
#' models, producing models with replicates and projections, and assessing niche
#' overlap are included as part of this package. Other functions implemented here
#' are useful to perform a series of pre- and post-modeling analyses.
#'
#' @section Main functions in ellipsenm:
#' \code{\link{thin_data}}, \code{\link{split_data}}, \code{\link{buffer_area}},
#' \code{\link{convex_area}}, \code{\link{concave_area}},
#' \code{\link{polygon_selection}}, \code{\link{explore_espace}},
#' \code{\link{ellipsoid_fit}}, \code{\link{predict}},
#' \code{\link{ellipsoid_calibration}}, \code{\link{partial_roc}},
#' \code{\link{prepare_sets}}, \code{\link{report}},
#' \code{\link{ellipsoid_model}}, \code{\link{overlap_object}},
#' \code{\link{ellipsoid_overlap}}, \code{\link{plot_overlap}}
#'
#' Other functions (important helpers)
#'
#' \code{\link{cluster_split}}, \code{\link{data_subsample}},
#' \code{\link{ellipsoid_volume}}, \code{\link{raster_poly}},
#' \code{\link{report_format}}, \code{\link{mbased_mve}},
#' \code{\link{mmm_ellipsoid}}, \code{\link{model_projection}},
#' \code{\link{save_areas}}, \code{\link{select_best}},
#' \code{\link{hypercube_boundaries}}, \code{\link{overlap_metrics}}
#'
#' @docType package
#' @name ellipsenm
NULL
