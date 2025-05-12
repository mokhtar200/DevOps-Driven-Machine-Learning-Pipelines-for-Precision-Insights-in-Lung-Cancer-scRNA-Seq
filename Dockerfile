
FROM rocker/tidyverse:latest

RUN R -e "install.packages(c('Seurat', 'SingleR', 'GEOquery', 'zellkonverter'))"
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install scikit-learn shap pandas matplotlib
