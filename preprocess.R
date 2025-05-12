
library(Seurat)
library(SingleR)
library(GEOquery)
library(zellkonverter)
library(SingleCellExperiment)

# Load data (example uses preprocessed matrix; use GEOquery for raw counts)
counts <- Read10X(data.dir = "data/raw/")
lung <- CreateSeuratObject(counts = counts, min.cells = 3, min.features = 200)
lung[["percent.mt"]] <- PercentageFeatureSet(lung, pattern = "^MT-")
lung <- subset(lung, subset = nFeature_RNA > 200 & percent.mt < 5)
lung <- SCTransform(lung, verbose = FALSE)
lung <- RunPCA(lung)
lung <- RunUMAP(lung, dims = 1:30)
lung <- FindNeighbors(lung, dims = 1:30)
lung <- FindClusters(lung, resolution = 0.5)

# Export pseudobulk
lung_avg <- AverageExpression(lung)$SCT
write.csv(lung_avg, file = "data/processed/pseudobulk_matrix.csv")

# Dummy labels (replace with real metadata)
labels <- data.frame(condition = ifelse(grepl("Tumor", colnames(lung_avg)), "Tumor", "Normal"))
write.csv(labels, file = "data/processed/labels.csv")
