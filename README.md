# DevOps-Driven-Machine-Learning-Pipelines-for-Precision-Insights-in-Lung-Cancer-scRNA-Seq

This project presents an end-to-end DevOps-integrated pipeline for preprocessing, analyzing, and modeling single-cell RNA-seq data from lung cancer samples.

## 📊 Dataset
- **Source:** GSE131907
- **Samples:** Tumor + Normal Lung Cells

## 🚀 Pipeline Overview

1. **Preprocessing:** Filtering, normalization, PCA, clustering
2. **Annotation:** Using known markers and SingleR
3. **Feature Engineering:** Pseudobulking per cluster
4. **ML Modeling:** Train/test split, Random Forest, SHAP explanations
5. **DevOps CI/CD:** Docker + GitHub Actions for reproducible pipelines

## 📦 Run with Docker

```bash
docker build -t lungsc-ml .
docker run lungsc-ml Rscript scripts/preprocess.R
docker run lungsc-ml python3 scripts/train_ml_model.py
