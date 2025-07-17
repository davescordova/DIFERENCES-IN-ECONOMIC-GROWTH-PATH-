# Thesis: "Divergent Paths of Agricultural Economic Development in Mato Grosso"

This repository contains all the data, code, and supplementary materials for my Master's thesis. 

**[Visit the thesis website for more details, interactive visualizations and the full content of the thesis](https://divergent-paths-of-agricultural-economic.onrender.com/)**

---

## 📄 Abstract

Using the framework of Institutional Economics, this thesis investigates the economic development of the Brazilian state of Mato Grosso. It argues that the new institutions established since the 1960s have been pivotal in paving the way for the state's significant economic growth.

---

## 🛠️ Tools & Methodology

The analysis was conducted using a **Two-Stage Least Squares (2SLS)** model on panel data with fixed effects. The primary software tools used were:

* **🐍 Python**: Used for creating maps, graphs, exploratory data analysis, and data visualizations.
    * *Key libraries: `pandas`, `geopandas`, `matplotlib`, `seaborn`, `plotly`, `esda`, `libpysal`.*

* **💧 Julia**: Employed for plotting geospatial data, such as the location of federal highways in the state.
    * *Key libraries: `GeoDataFrames`, `Plots`, `Shapefile`, `GeoJSON`, `ArchGDAL`.*

* **📈 Stata**: Utilized for the core econometric regressions of the study.

---

## 📂 Repository Structure

All files are located in the `main` branch and organized into the following directories:

* `Production--Regression-Analysis`: Contains the Stata `do-files` used to perform the regression analysis.
* `Exploratory_Statiscs/`: Contains Python scripts and Jupyter Notebooks for exploratory data analysis.
* `Graphs/`: Contains Python and Julia code (Jupyter Notebooks) used to generate the graphs, maps, and other data visualizations for the thesis.

---

## 🚀 How to Replicate the Results

To replicate the analysis and results, please follow the steps below.

### 1. Prerequisites
Ensure you have the following software installed:
* Stata
* Python 3.x (Anaconda distribution recommended)
* Julia

### 2. Clone the Repository
Open your terminal (Git Bash, Terminal, etc.) and run the command below to download the files:
```bash
git clone [https://github.com/davescordova/DIFERENCES-IN-ECONOMIC-GROWTH-PATH-IN-MATO-GROSSO.git](https://github.com/davescordova/DIFERENCES-IN-ECONOMIC-GROWTH-PATH-IN-MATO-GROSSO.git)
