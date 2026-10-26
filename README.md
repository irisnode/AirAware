# 🌍 AirAware — Community Air Quality Intelligence

**AirAware** is a data analysis and machine learning project that explores air quality observations across India. Built using R, the project applies data cleaning, exploratory data analysis, statistical anomaly detection, and K-means clustering to identify patterns in pollutant measurements.

The goal is to transform raw air quality data into meaningful insights that can support further environmental analysis and public awareness.

> **Project status:** Initial data analysis and clustering completed.

## 📌 Problem Statement

Air pollution is an important environmental and public health concern. Air quality datasets can contain missing values, inconsistent observations, and unusual measurements that make analysis challenging.

AirAware explores how data analysis and unsupervised machine learning can help organize air quality observations, identify statistical outliers, and discover similarities between monitoring stations.

## 🎯 Objectives

* Clean and prepare air quality data for analysis.
* Explore the distribution of different pollutants.
* Compare pollutant measurements across available observations.
* Detect statistically unusual pollutant readings using the Interquartile Range (IQR) method.
* Group monitoring stations using K-means clustering.
* Visualize the findings using plots generated in R.
* Build a foundation for future environmental intelligence applications.

## ✨ Features

### 1. Data Cleaning

* Identifies missing pollutant measurements.
* Removes records with missing essential values.
* Filters invalid geographic coordinates and negative average pollutant readings.
* Saves the cleaned dataset for further analysis.

### 2. Exploratory Data Analysis

* Examines the number of observations available for each pollutant.
* Calculates average, median, and maximum pollutant readings.
* Visualizes pollutant distributions and city-level observations.

### 3. Statistical Anomaly Detection

* Uses the Interquartile Range method to identify unusually high pollutant readings.
* Saves flagged observations for further investigation.
* Helps identify measurements that may deserve additional attention.

### 4. K-Means Clustering

* Organizes monitoring stations using their pollutant measurements.
* Standardizes pollutant features before clustering.
* Uses K-means with three clusters.
* Compares average pollutant measurements across the resulting clusters.

### 5. Data Visualization

Generates plots to make the results easier to interpret.

## 🛠️ Tech Stack

* **Programming language:** R
* **Development environment:** RStudio
* **Machine learning:** K-means clustering
* **Statistical method:** Interquartile Range (IQR)
* **Visualization:** R plotting functions
* **Version control:** Git and GitHub

## 📊 Dataset

The project uses the dataset titled **Real Time Air Quality Index from Various Locations**, obtained from the Government of India's Open Government Data platform.

* **Data provider:** Central Pollution Control Board (CPCB)
* **Platform:** Government of India Open Government Data (OGD)
* **Dataset source:** https://www.data.gov.in/resource/real-time-air-quality-index-various-locations

The downloaded snapshot contained 3,682 rows and 11 columns, including location information, monitoring station details, observation timestamps, pollutant identifiers, and minimum, maximum, and average pollutant measurements.

The dataset contains pollutant identifiers such as:

* CO — Carbon Monoxide
* NH3 — Ammonia
* NO2 — Nitrogen Dioxide
* OZONE — Ozone
* PM10 — Particulate Matter 10
* PM2.5 — Particulate Matter 2.5
* SO2 — Sulphur Dioxide

**Data availability:** The raw and derived CSV files are excluded from the initial Git upload until the licence terms for the specific dataset resource have been verified. Obtain the dataset from its official source before running the scripts.

## 🔄 Project Workflow

1. **Data collection:** Obtain the air quality dataset from the official source.
2. **Data cleaning:** Remove records with missing essential measurements and filter invalid values.
3. **Exploratory analysis:** Calculate descriptive statistics and generate visualizations.
4. **Anomaly detection:** Apply the IQR method to flag unusually high average pollutant readings.
5. **Feature preparation:** Organize pollutant measurements by monitoring station and retain stations with complete measurements for all seven pollutants.
6. **Feature scaling:** Standardize the pollutant variables before clustering.
7. **K-means clustering:** Group monitoring stations into three clusters.
8. **Interpretation:** Compare cluster profiles and examine station-level pollutant measurements.

## 📈 Results and Observations

### Data Cleaning

| Metric                          | Result |
| ------------------------------- | -----: |
| Original records                |  3,682 |
| Records removed during cleaning |    344 |
| Cleaned records                 |  3,338 |
| Original columns                |     11 |

The cleaned dataset contains 3,338 records after removing observations with missing essential pollutant measurements and filtering invalid values.

### Pollutant Analysis

The number of available observations differed by pollutant.

| Pollutant | Records |
| --------- | ------: |
| CO        |     508 |
| OZONE     |     502 |
| NO2       |     484 |
| PM10      |     474 |
| PM2.5     |     473 |
| SO2       |     460 |
| NH3       |     437 |

These counts describe the cleaned dataset and should not be interpreted as pollution severity.

### Anomaly Detection

The IQR method flagged **115 observations** as unusually high relative to the distribution of their respective pollutant measurements.

Examples included high PM2.5 readings in locations such as Noida and Delhi.

These are statistical outliers, not confirmed pollution emergencies. Unusual observations may represent genuine environmental conditions, measurement issues, or other factors that require further investigation.

### Monitoring Station Coverage

| Metric                                         | Result |
| ---------------------------------------------- | -----: |
| Cleaned observations                           |  3,338 |
| Unique cities represented                      |    273 |
| Unique monitoring stations                     |    526 |
| Stations with all seven pollutant measurements |    377 |

For clustering, the analysis retained the 377 stations with complete measurements for all seven pollutant features.

### K-Means Clustering

The project applied K-means clustering with three clusters after standardizing the pollutant measurements.

| Cluster   | Number of Stations | General Observation                                                             |
| --------- | -----------------: | ------------------------------------------------------------------------------- |
| Cluster 1 |                 68 | Higher average PM2.5, PM10, CO, and NO2 measurements                            |
| Cluster 2 |                108 | Intermediate particulate measurements and the highest average ozone measurement |
| Cluster 3 |                201 | Lower average particulate, CO, and NO2 measurements                             |

Cluster labels are algorithm-generated identifiers, not official air quality categories.

The clusters describe similarities in the selected measurements. They should not be interpreted as formal health-risk classifications.

## 📉 Visualizations

The project generates the following plots:

| Plot                       | Description                                      |
| -------------------------- | ------------------------------------------------ |
| `pollutant_counts.png`     | Number of observations for each pollutant        |
| `pollutant_averages.png`   | Average measurements for each pollutant          |
| `top_10_cities.png`        | City-level observations included in the analysis |
| `air_quality_clusters.png` | Visualization of the resulting clusters          |

The images are available in the `plots/` directory.

**Note:** Pollutants can use different measurement units and have different health implications. Their numerical averages should not be compared directly as equivalent measures of risk.

## 📁 Project Structure

```text
AirAware/
├── README.md
├── .gitignore
├── R/
│   ├── 01_data_cleaning.R
│   ├── 02_exploratory_analysis.R
│   ├── 03_anomaly_detection.R
│   └── 04_kmeans_clustering.R
├── data/
│   └── CSV datasets and generated analysis results
└── plots/
    ├── pollutant_counts.png
    ├── pollutant_averages.png
    ├── top_10_cities.png
    └── air_quality_clusters.png
```

The CSV files are not included in the initial Git upload. The directory structure above documents the project's local organization.

## 🚀 How to Run the Project

### Prerequisites

Install:

* R
* RStudio
* Git, if you plan to use Git from the terminal

### Step 1: Obtain the Dataset

Download the air quality dataset from the official OGD platform and save it as:

`data/air_quality_india.csv`

Check the dataset's licence before redistributing the original file.

### Step 2: Open the Project

Open the AirAware folder in RStudio or set it as your working directory.

### Step 3: Run the Scripts in Order

Run the scripts in this sequence:

1. `R/01_data_cleaning.R`
2. `R/02_exploratory_analysis.R`
3. `R/03_anomaly_detection.R`
4. `R/04_kmeans_clustering.R`

Each script depends on the files or results produced by earlier stages.

### Step 4: Inspect the Results

Review the generated CSV outputs in `data/` and visualizations in `plots/`.

Some scripts may need package installation or minor path adjustments depending on your R environment.

## ⚠️ Limitations

* The analysis uses a downloaded snapshot of air quality observations rather than a continuous historical dataset.
* Results describe the downloaded snapshot and should not be interpreted as current air quality readings.
* Missing observations and incomplete station coverage may affect the analysis.
* The IQR method identifies statistical outliers, not confirmed pollution incidents.
* K-means results depend on feature selection, scaling, and the chosen number of clusters.
* The clusters are exploratory groups and are not official air quality classifications.
* Pollutant units and measurement conditions should be verified before making direct comparisons.
* The analysis does not establish causal relationships or predict future air pollution levels.

## 🔮 Future Enhancements

* Build an interactive dashboard for exploring air quality measurements.
* Add geographic maps showing monitoring station locations.
* Compare observations across dates when a suitable historical dataset is available.
* Investigate additional anomaly detection methods.
* Evaluate different clustering algorithms and cluster counts.
* Explore time-series forecasting when reliable historical data becomes available.
* Develop a more accessible interface for students and community users.

## 📚 Learning Outcomes

Through AirAware, I explored:

* Data cleaning and preprocessing in R.
* Exploratory data analysis and descriptive statistics.
* Data visualization.
* Statistical anomaly detection using IQR.
* Feature scaling and K-means clustering.
* Interpretation of unsupervised machine learning results.
* Organizing a data science project for reproducibility and version control.

## 📄 Data Source, Licence, and Attribution

**Dataset:** Real Time Air Quality Index from Various Locations
**Provider:** Central Pollution Control Board (CPCB), Government of India
**Source:** https://www.data.gov.in/resource/real-time-air-quality-index-various-locations

The licence applicable to the specific dataset resource must be verified before redistributing the raw dataset or derived files.

Where required by the applicable licence, attribution and other licence conditions must be followed. AirAware is an independent educational project and is not affiliated with or endorsed by the Government of India or CPCB.

## 👩‍💻 Author

**Shriya Dubey**

B.Tech Computer Science and Engineering

Interested in data science, machine learning, and technology for environmental and social impact.

---

*AirAware is an educational project. Its outputs are intended for exploratory analysis and should not be used as a substitute for official air quality advisories or professional environmental assessments.*
