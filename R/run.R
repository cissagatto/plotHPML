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



##############################################################################
# WORKSPACE SETUP
##############################################################################

FolderRoot <- "~/plotHPML"
FolderScripts <- "~/plotHPML/R"
FolderData <- "~/plotHPML/Data"
FolderPlot <- "~/plotHPML/Plots"


##############################################################################
# LOAD SCRIPTS AND LIBRARIES
##############################################################################


setwd(FolderScripts)
source("libraries.R")
source("plot_hpml.R")


##############################################################################
# HYBRID PARTITIONS HEATMAP PLOT (for multiple partitions)
##############################################################################

file.name <- paste(FolderData, "/partition_ex2.csv", sep = "")
partitions <- data.frame(read.csv(file.name))
pdf.filename <- paste(FolderPlot, "/partition_ex2.pdf", sep = "")
hpml.heatmap(df = partitions, pdf.filename = pdf.filename, title = "Partition example 2")




##############################################################################
# HYBRID PARTITION PLOT (for a single partition)
##############################################################################

file.name <- paste(FolderData, "/partition_ex1.csv", sep = "")
partitions <- data.frame(read.csv(file.name))
pdf.filename <- paste(FolderPlot, "/partition_ex1.pdf", sep = "")
hpml.plot(df = partitions, partition_col = "cluster")
hpml.save.plot(df = partitions, partition_col = "cluster", 
                filename = pdf.filename, width = 8, height = 8, 
                units = "in", dpi = 300)




##############################################################################
# END OF SCRIPT
##############################################################################
