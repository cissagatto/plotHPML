##############################################################################
# Copyright (C) 2024                                                         #
#                                                                            #
# This code is free software: you can redistribute it and/or modify it under #
# the terms of the GNU General Public License as published by the Free       #
# Software Foundation, either version 3 of the License, or (at your option)  #
# any later version. This code is distributed in the hope that it will be    #
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of     #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General   #
# Public License for more details.                                           #
#                                                                            #
# Prof. Elaine Cecilia Gatto | Prof. Ricardo Cerri | Prof. Mauri Ferrandin   #
#                                                                            #
# Federal University of São Carlos - UFSCar - https://www2.ufscar.br         #
# Campus São Carlos - Computer Department - DC - https://site.dc.ufscar.br   #
# Post Graduate Program in Computer Science - PPGCC                          # 
# http://ppgcc.dc.ufscar.br - Bioinformatics and Machine Learning Group      #
# BIOMAL - http://www.biomal.ufscar.br                                       #
#                                                                            #
##############################################################################


FolderRoot <- "~/plotHPML"
FolderScripts <- "~/plotHPML/R"


#' Generate a heatmap from a dataframe
#'
#' This function generates a heatmap from a dataframe containing partition and 
#' cluster information and saves it as a PDF.
#'
#' @param df A dataframe containing the data to be visualized. Must have a 
#'   "label" column and partition columns.
#' @param pdf.filename The filename where the PDF will be saved.
#' @param title The title of the heatmap plot.
#'
#' @return A PDF file with the heatmap.
#' @export
#'
#' @examples
#' df <- data.frame(label = c("A", "B", "C"), partition1 = c(1, 2, 3))
#' hpml.heatmap(df, "heatmap.pdf", "My Heatmap")
#'
hpml.heatmap <- function(df, pdf.filename, title) {
  
  # Convert the dataframe from wide to long format
  df_long <- melt(df, 
                  id.vars = "label", 
                  variable.name = "partition", 
                  value.name = "cluster")
  
  # Create a color palette based on the number of unique clusters
  palette <- colorRampPalette(c("lavender", "purple"))(length(unique(df_long$cluster)))
  
  # Open a PDF device to save the plot
  pdf(file = pdf.filename, width = 10, height = 6)
  
  # Create the heatmap plot
  plot <- ggplot(df_long, aes(x = partition, y = label, 
                              fill = as.factor(cluster))) +
    geom_tile(color = "white") +
    geom_text(aes(label = cluster), color = "black", size = 3) +
    scale_fill_manual(values = palette, name = "Cluster") +
    labs(title = title,
         x = "Partition",
         y = "Label") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  # Print the plot to the PDF
  print(plot)
  
  # Close the PDF device
  dev.off()
}

#' Plot clusters as circles within a square grid
#'
#' This function generates a visual representation of clusters as circles 
#' within a dynamically sized square grid based on the partition column.
#'
#' @param df A data frame containing the data with labels and partition 
#'   information. It must have a column with labels and a column with cluster 
#'   or partition information.
#' @param partition_col A string representing the name of the column in 'df' 
#'   that contains the partition or cluster information to be visualized.
#'
#' @return A `ggplot` object displaying clusters as circles arranged in a square grid.
#' @export
#'
#' @examples
#' df <- data.frame(label = c("A", "B", "C"), cluster = c(1, 2, 3))
#' plot <- hpml.plot(df, "cluster")
#' print(plot)
#'
hpml.plot <- function(df, partition_col) {
  
  # Select the partition column and rename it to 'group'
  df <- df %>%
    select(label, all_of(partition_col)) %>%
    rename(group = all_of(partition_col))
  
  # Calculate the number of groups in the partition
  n_groups <- length(unique(df$group))
  
  # Calculate the side length of the grid for distributing circles
  side_length <- ceiling(sqrt(n_groups))
  
  # Dynamically define the size of the square
  # Adjustable multiplier to control spacing
  square_size <- side_length * 2  
  
  # Generate positions for the groups in a grid within the square
  group_positions <- expand.grid(
    x = seq(1, side_length),
    y = seq(1, side_length)
  )[1:n_groups, ]
  
  # Normalize positions to the square size and adjust centering
  group_positions <- group_positions %>%
    mutate(x = (x - 0.5) * (square_size / side_length),
           y = (y - 0.5) * (square_size / side_length))
  
  group_positions$group <- unique(df$group)
  
  # Combine positions with labels
  df <- df %>%
    left_join(group_positions, by = "group")
  
  # Group labels within each group and concatenate names
  df_grouped <- df %>%
    group_by(group, x, y) %>%
    summarize(labels = paste(label, collapse = "\n"), .groups = 'drop')
  
  # Create the plot
  ggplot(df_grouped) +
    annotate("rect", xmin = 0, xmax = square_size, ymin = 0, ymax = square_size,
             fill = "white", color = "black", linetype = "dashed") +
    geom_circle(aes(x0 = x, y0 = y, r = 0.9), 
                color = "black", fill = "lightgray", 
                linewidth = 1, alpha = 0.5) +
    geom_text(aes(x = x, y = y + 0.2, label = labels), 
              size = 5, hjust = 0.5, vjust = 0.5) +
    geom_text(aes(x = x, y = y - 0.8, label = group), 
              size = 5, fontface = "bold", color = "#800000") +
    annotate("text", x = square_size / 2, y = square_size + 0.3, 
             label = partition_col, size = 6, fontface = "bold", hjust = 0.5) +
    coord_fixed(ratio = 1) +
    theme_void() +
    theme(
      plot.margin = margin(t = -1, r = -1, b = -1, l = -1, unit = "inches"),  
      # Use negative margins to reduce space
      panel.spacing = unit(0, "lines")  
      # Remove spacing between panels
    ) +
    xlim(-1, square_size + 1) +
    ylim(-1, square_size + 1)
}


#' Save plot as PDF
#'
#' This function saves a plot generated by `plot.hpml` as a PDF file with the 
#' specified dimensions and resolution.
#'
#' @param df Data frame containing the data with labels and partition information.
#' @param partition_col The name of the column in 'df' representing the partition 
#'   or cluster to be visualized.
#' @param filename The name of the file where the plot will be saved (including path).
#' @param width The width of the output file.
#' @param height The height of the output file.
#' @param units The units for width and height (e.g., "in" for inches, "cm" for centimeters).
#' @param dpi The resolution of the output file in dots per inch.
#'
#' @return The plot is saved to the specified file, with no return value.
#' @export
#'
#' @examples
#' df <- data.frame(label = c("A", "B", "C"), cluster = c(1, 2, 3))
#' hpml.save.plot(df, "cluster", "output.pdf", width = 8, height = 8, units = "in", dpi = 300)
#'
hpml.save.plot <- function(df, 
                           partition_col, 
                           filename,
                           width,
                           height,
                           units,
                           dpi) {
  
  # Generate the plot using the plot.hpml function
  p <- hpml.plot(df, partition_col)
  
  # Save the plot as a PDF with the specified parameters
  ggsave(filename = filename, plot = p, device = "pdf", 
         width = width, height = height, units = units, dpi = dpi)
}

