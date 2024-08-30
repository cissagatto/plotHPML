##############################################################################
# Copyright (C) 2024                                                         #
#                                                                            #
# CC BY-NC-SA 4.0                                                            #
#                                                                            #
# Canonical URL https://creativecommons.org/licenses/by-nc-sa/4.0/           #
# Attribution-NonCommercial-ShareAlike 4.0 International CC BY-NC-SA 4.0     #
#                                                                            #
# Prof. Elaine Cecilia Gatto | Prof. Ricardo Cerri | Prof. Mauri Ferrandin   #
#                                                                            #
# Federal University of São Carlos - UFSCar - https://www2.ufscar.br         #
# Campus São Carlos - Computer Department - DC - https://site.dc.ufscar.br   #
# Post Graduate Program in Computer Science - PPGCC                          # 
# http://ppgcc.dc.ufscar.br - Bioinformatics and Machine Learning Group      #
# BIOMAL - http://www.biomal.ufscar.br                                       #
#                                                                            #
# You are free to:                                                           #
#     Share — copy and redistribute the material in any medium or format     #
#     Adapt — remix, transform, and build upon the material                  #
#     The licensor cannot revoke these freedoms as long as you follow the    #
#       license terms.                                                       #
#                                                                            #
# Under the following terms:                                                 #
#   Attribution — You must give appropriate credit , provide a link to the   #
#     license, and indicate if changes were made . You may do so in any      #
#     reasonable manner, but not in any way that suggests the licensor       #
#     endorses you or your use.                                              #
#   NonCommercial — You may not use the material for commercial purposes     #
#   ShareAlike — If you remix, transform, or build upon the material, you    #
#     must distribute your contributions under the same license as the       #
#     original.                                                              #
#   No additional restrictions — You may not apply legal terms or            #
#     technological measures that legally restrict others from doing         #
#     anything the license permits.                                          #
#                                                                            #
##############################################################################


# rm(list=ls())



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

#setwd(FolderScripts)
#source("libraries.R")
#source("plot_hpml.R")

library(plotHPML)


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
