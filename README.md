# Plot Hybrid Partitions for Multi-Label Classification

This repository contains code for visualizing hybrid partitions, a method that plays a significant role in my PhD thesis. The code is designed to plot data partitions, specifically to highlight the differences between label clusters and instance clusters. However, it can be easily adapted to visualize any type of data partition.

## CSV Example

The input to the plotting functions is a CSV file formatted as follows:

| cluster | label   |
| ------- | ------- |
|    1    | label_1 |
|    3    | label_2 |
|    2    | label_3 |
|    2    | label_4 |
|    1    | label_5 |
|    3    | label_6 |

### Notes:
- The `cluster` column contains the cluster ID to which each label belongs.
- The `label` column contains the labels that need to be visualized.
- Ensure your CSV follows this structure for correct visualization. An example CSV file is provided in the repository for reference.

## How to Use the Code

### 1. Set Up the Workspace

First, you need to define your workspace paths. The script includes variables for setting the root folder, script folder, data folder, and plots folder. Modify these paths according to your directory structure.

```r
# Define the root folder and subfolders
FolderRoot <- "~/Plot_HPML"
FolderScripts <- "~/Plot_HPML/R"
FolderData <- "~/Plot_HPML/Data"
FolderPlot <- "~/Plot_HPML/Plots"
```

### 2. Load the Required Scripts

Set the working directory to the scripts folder and load the necessary libraries and functions:

```r
setwd(FolderScripts)
source("libraries.R")
source("plot_hpml.R")
```

### 3. Plotting Hybrid Partitions

You can generate and save two types of plots for the hybrid partitions:

#### A. A Heatmap for Multiple Partitions

To visualize multiple partitions in a heatmap format:

```r
# Load the data for multiple partitions
file.name <- paste(FolderData, "/partition_ex2.csv", sep = "")
partitions <- data.frame(read.csv(file.name))

# Define the output PDF filename
pdf.filename <- paste(FolderPlot, "/partition_ex2.pdf", sep = "")

# Generate and save the heatmap plot
hpml.heatmap(df = partitions, 
             pdf.filename = pdf.filename, 
             title = "Partition example 2")
```


<p align="center"><img src="https://github.com/cissagatto/Plot_HPML/blob/main/Plot/partition_ex2.png" width="640" height="360"/> </a>


#### B. Hybrid Partition itself

To visualize the hybrid partition:

```r
# Load the data for a single partition
file.name <- paste(FolderData, "/partition_ex1.csv", sep = "")
partitions <- data.frame(read.csv(file.name))

# Define the output PDF filename
pdf.filename <- paste(FolderPlot, "/partition_ex1.pdf", sep = "")

# Generate the partition plot
plot.hpml(df = partitions, partition_col = "cluster")

# Save the plot as a PDF
save.plot.hpml(df = partitions, partition_col = "cluster", 
               filename = pdf.filename, width = 8, height = 8, 
               units = "in", dpi = 300)
```

<p align="center"><img src="https://github.com/cissagatto/Plot_HPML/blob/main/Plot/partition_ex1.png" width="360" height="360"/> </a>


### 4. Output

The output will be a PDF file saved in the specified `FolderPlot` directory. The plot will show the clusters as circles, with labels grouped inside each cluster.


## Contributing

We welcome contributions! If you find a bug or have a feature request, please open an issue on our GitHub page. You can also contribute by submitting a pull request.


## Acknowledgment
- This study was financed in part by the Coordenação de Aperfeiçoamento de Pessoal de Nível Superior - Brasil (CAPES) - Finance Code 001.
- This study was financed in part by the Conselho Nacional de Desenvolvimento Científico e Tecnológico - Brasil (CNPQ) - Process number 200371/2022-3.
- The authors also thank the Brazilian research agencies FAPESP financial support.

# Contact
elainececiliagatto@gmail.com

# Links

| [Site](https://sites.google.com/view/professor-cissa-gatto) | [Post-Graduate Program in Computer Science](http://ppgcc.dc.ufscar.br/pt-br) | [Computer Department](https://site.dc.ufscar.br/) |  [Biomal](http://www.biomal.ufscar.br/) | [CNPQ](https://www.gov.br/cnpq/pt-br) | [Ku Leuven](https://kulak.kuleuven.be/) | [Embarcados](https://www.embarcados.com.br/author/cissa/) | [Read Prensa](https://prensa.li/@cissa.gatto/) | [Linkedin Company](https://www.linkedin.com/company/27241216) | [Linkedin Profile](https://www.linkedin.com/in/elainececiliagatto/) | [Instagram](https://www.instagram.com/cissagatto) | [Facebook](https://www.facebook.com/cissagatto) | [Twitter](https://twitter.com/cissagatto) | [Twitch](https://www.twitch.tv/cissagatto) | [Youtube](https://www.youtube.com/CissaGatto) |

