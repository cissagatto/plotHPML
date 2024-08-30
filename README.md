# Plot Hybrid Partitions for Multi-Label Classification

This repository contains code for visualizing hybrid partitions, a method that plays a significant role in my PhD thesis. The code is designed to plot label partitions, specifically to highlight the differences between label clusters and instance clusters. However, it can be easily adapted to visualize any type of data partition.

## How to cite

```plaintext
@misc{plotHPML2024,
  author = {Elaine Cecília Gatto},
  title = {plotHPML: A package to plot label partitions},  
  year = {2024},
  note = {R package version 0.1.0. Licensed under CC BY-NC-SA 4.0},
  doi = {DOI: 10.13140/RG.2.2.11938.44484},
  url = {https://github.com/cissagatto/plotHPML}
}
```

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

### 1. Package

First, install and call the package plotHPML.

```r
library(plotHPML)
```

### 2. Plotting Hybrid Partitions

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


<p align="center"><img src="~/plotHPMLPlots/partition_ex2.png" width="640" height="360"/> </a>


#### B. Hybrid Partition itself

To visualize the hybrid partition see the example bellow. The `save.plot.hpml` function save the plot in a PDF format, but you can change that in the code if you want. The `plot.hpml` is the function that plot the partiton itsel.

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


### Documentation

For more detailed documentation on each function, check out the `~/plotHPML/docs`folder



## 📚 **Contributing**

We welcome contributions from the community! If you have suggestions, improvements, or bug fixes, please submit a pull request or open an issue in the GitHub repository.


## Acknowledgment
- This study was financed in part by the Coordenação de Aperfeiçoamento de Pessoal de Nível Superior - Brasil (CAPES) - Finance Code 001.
- This study was financed in part by the Conselho Nacional de Desenvolvimento Científico e Tecnológico - Brasil (CNPQ) - Process number 200371/2022-3.
- The authors also thank the Brazilian research agencies FAPESP financial support.

## 📧 **Contact**

For any questions or support, please contact:
- **Prof. Elaine Cecilia Gatto** (elainececiliagatto@gmail.com)
  

# Links

| [Site](https://sites.google.com/view/professor-cissa-gatto) | [Post-Graduate Program in Computer Science](http://ppgcc.dc.ufscar.br/pt-br) | [Computer Department](https://site.dc.ufscar.br/) |  [Biomal](http://www.biomal.ufscar.br/) | [CNPQ](https://www.gov.br/cnpq/pt-br) | [Ku Leuven](https://kulak.kuleuven.be/) | [Embarcados](https://www.embarcados.com.br/author/cissa/) | [Read Prensa](https://prensa.li/@cissa.gatto/) | [Linkedin Company](https://www.linkedin.com/company/27241216) | [Linkedin Profile](https://www.linkedin.com/in/elainececiliagatto/) | [Instagram](https://www.instagram.com/cissagatto) | [Facebook](https://www.facebook.com/cissagatto) | [Twitter](https://twitter.com/cissagatto) | [Twitch](https://www.twitch.tv/cissagatto) | [Youtube](https://www.youtube.com/CissaGatto) |


---

**Happy Hybrid Partitions** 🎉
