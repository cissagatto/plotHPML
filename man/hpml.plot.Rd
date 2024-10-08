% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_hpml.R
\name{hpml.plot}
\alias{hpml.plot}
\title{Plot clusters as circles within a square grid}
\usage{
hpml.plot(df, partition_col)
}
\arguments{
\item{df}{A data frame containing the data with labels and partition 
information. It must have a column with labels and a column with cluster 
or partition information.}

\item{partition_col}{A string representing the name of the column in 'df' 
that contains the partition or cluster information to be visualized.}
}
\value{
A `ggplot` object displaying clusters as circles arranged in a square grid.
}
\description{
This function generates a visual representation of clusters as circles 
within a dynamically sized square grid based on the partition column.
}
\examples{
df <- data.frame(label = c("A", "B", "C"), cluster = c(1, 2, 3))
plot <- hpml.plot(df, "cluster")
print(plot)

}
