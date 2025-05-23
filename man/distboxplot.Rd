% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outliermethods.R
\name{distboxplot}
\alias{distboxplot}
\title{Distribution boxplot}
\usage{
distboxplot(data, var, output, p1 = 0.025, p2 = 0.975, boot, pc, pcvar)
}
\arguments{
\item{data}{Dataframe or vector where to check outliers.}

\item{var}{Variable to be used for outlier detection if \strong{data} is not a vector file.}

\item{output}{Either \strong{clean}: for clean data output without outliers; \strong{outliers}:
for outlier data frame or vectors.}

\item{p1, p2}{Different pvalues for outlier detection \code{Schwertman et al. 2004)}.}
}
\value{
Either clean or outliers.
}
\description{
Distribution boxplot
}
\examples{

\dontrun{

data("efidata")

gbd <- check_names(data = efidata, colsp='scientificName', pct=90, merge=TRUE)

db <- sf::st_read(system.file('extdata/danube/basinfinal.shp', package='specleanr'), quiet = TRUE)

wcd <- terra::rast(system.file('extdata/worldclim.tiff', package='specleanr'))

refdata <- pred_extract(data = gbd, raster= wcd , lat = 'decimalLatitude', lon= 'decimalLongitude',
                          colsp = 'speciescheck',
                          bbox = db,
                          multiple = TRUE,
                          minpts = 10)

 bxout <- distboxplot(data = refdata[['Salmo trutta']], var = 'bio6', output='outlier')
}
}
