# 🌍 AirAware — Community Air Quality Intelligence

AirAware is a data analysis and unsupervised machine learning project that explores air quality observations from monitoring stations across India. Developed using R, the project applies data cleaning, exploratory data analysis, statistical anomaly detection, and K-means clustering to investigate patterns in pollutant measurements.

The project aims to transform raw air quality observations into interpretable insights and establish a foundation for future environmental data analysis applications.

**Project status:** Initial data analysis, anomaly detection, and clustering completed.

## Table of Contents

* [Problem Statement](#problem-statement)
* [Objectives](#objectives)
* [Features](#features)
* [Technology Stack](#technology-stack)
* [Dataset](#dataset)
* [Project Workflow](#project-workflow)
* [Results and Observations](#results-and-observations)
* [Visualizations](#visualizations)
* [Project Structure](#project-structure)
* [Installation and Usage](#installation-and-usage)
* [Limitations](#limitations)
* [Future Enhancements](#future-enhancements)
* [Learning Outcomes](#learning-outcomes)
* [Data Attribution and Licensing](#data-attribution-and-licensing)
* [Author](#author)

## Problem Statement

Air pollution is an important environmental and public health concern. Analysing air quality observations can be challenging because datasets may contain missing measurements, incomplete monitoring station coverage, and unusual values.

AirAware explores how statistical analysis and unsupervised machine learning can help clean air quality data, summarize pollutant measurements, identify statistical outliers, and group monitoring stations with similar pollutant profiles.

The project is intended for exploratory analysis and educational purposes. Its outputs are not official air quality assessments.

## Objectives

* Clean and preprocess air quality observations for analysis.
* Examine the distribution and availability of different pollutant measurements.
* Calculate descriptive statistics for individual pollutants.
* Detect statistically unusual pollutant readings using the Interquartile Range (IQR) method.
* Group monitoring stations using K-means clustering.
* Visualize key findings through plots generated in R.
* Establish a reproducible foundation for future environmental data applications.

## Features

### 1. Data Cleaning and Preprocessing

* Identifies missing pollutant measurements.
* Removes records with missing essential values.
* Filters invalid geographic coordinates and negative average pollutant readings.
* Produces a cleaned dataset for downstream analysis.

### 2. Exploratory Data Analysis

* Examines the number of available observations for each pollutant.
* Calculates average, median, and maximum pollutant measurements.
* Generates visualizations to support comparisons across pollutants and cities.

### 3. Statistical Anomaly Detection

* Applies the IQR method to identify unusually high average pollutant readings.
* Saves flagged observations for further examination.
* Distinguishes statistical outliers from confirmed environmental incidents.

### 4. K-Means Clustering

* Aggregates pollutant measurements by monitoring station.
* Selects stations with complete measurements for the seven pollutant features.
* Standardizes pollutant variables before clustering.
* Applies K-means with three clusters.
* Compares pollutant profiles across the resulting groups.

### 5. Data Visualization

Generates plots summarizing pollutant observation counts, average measurements, city-level observations, and station clusters.

## Technology Stack

| Component                     | Technology                |
| ----------------------------- | ------------------------- |
| Programming language          | R                         |
| Development environment       | RStudio                   |
| Data cleaning and analysis    | Base R                    |
| Statistical anomaly detection | Interquartile Range (IQR) |
| Unsupervised machine learning | K-means clustering        |
| Visualization                 | R plotting functions      |
| Version control               | Git                       |
| Repository hosting            | GitHub                    |

## Dataset

The project uses the dataset titled **Real Time Air Quality Index from Various Locations**, published through the Government of India's Open Government Data platform.

* **Data provider:** Central Pollution Control Board (CPCB)
* **Platform:** Open Government Data (OGD), Government of India
* **Official dataset resource:** [Real Time Air Quality Index from Various Locations](https://www.data.gov.in/resource/real-time-air-quality-index-various-locations)

The downloaded snapshot contained 3,682 rows and 11 columns, including location information, monitoring station details, observation timestamps, pollutant identifiers, and minimum, maximum, and average pollutant measurements.

The seven pollutant identifiers used in the analysis are:

| Identifier | Pollutant                                                                              |
| ---------- | -------------------------------------------------------------------------------------- |
| CO         | Carbon monoxide                                                                        |
| NH3        | Ammonia                                                                                |
| NO2        | Nitrogen dioxide                                                                       |
| OZONE      | Ozone                                                                                  |
| PM10       | Particulate matter with an aerodynamic diameter of up to approximately 10 micrometres  |
| PM2.5      | Particulate matter with an aerodynamic diameter of up to approximately 2.5 micrometres |
| SO2        | Sulphur dioxide                                                                        |

The numerical measurements and their units should be interpreted according to the source dataset's documentation.

**Data availability:** Raw and generated CSV files are excluded from the Git repository while the licence applicable to the specific dataset resource is verified. Users must obtain the dataset from its official source before running the analysis.

## Project Workflow

The analysis follows this sequence:

1. **Data collection:** Obtain the source dataset and place it in the expected project directory.
2. **Data cleaning:** Remove records with missing essential measurements and filter invalid values.
3. **Exploratory analysis:** Calculate descriptive statistics and generate visualizations.
4. **Anomaly detection:** Apply the IQR method to flag unusually high average pollutant readings.
5. **Station-level feature preparation:** Organize pollutant measurements by monitoring station and retain stations with complete measurements for all seven pollutant features.
6. **Feature scaling:** Standardize the pollutant variables so differences in numerical scales do not dominate the distance-based clustering.
7. **K-means clustering:** Group monitoring stations into three clusters.
8. **Interpretation:** Compare cluster profiles and examine station-level pollutant measurements.

## Results and Observations

The results below describe the downloaded dataset snapshot used during development. They should not be interpreted as current air quality readings.

### Data Cleaning

| Metric                          | Result |
| ------------------------------- | -----: |
| Original records                |  3,682 |
| Records removed during cleaning |    344 |
| Cleaned records                 |  3,338 |
| Original columns                |     11 |

The cleaning process retained 3,338 records after removing observations with missing essential pollutant measurements and filtering invalid values.

### Pollutant Observation Counts

| Pollutant | Number of records |
| --------- | ----------------: |
| CO        |               508 |
| OZONE     |               502 |
| NO2       |               484 |
| PM10      |               474 |
| PM2.5     |               473 |
| SO2       |               460 |
| NH3       |               437 |

The number of observations differs across pollutants. These counts describe data availability and do not indicate pollution severity.

### Anomaly Detection

The IQR-based anomaly detection process flagged **115 observations** as unusually high relative to the distribution of the corresponding pollutant measurements.

Examples included high PM2.5 measurements in locations such as Noida and Delhi.

These observations are statistical outliers, not confirmed pollution emergencies. They may represent genuine environmental conditions, measurement errors, or other factors that require further investigation.

### Monitoring Station Coverage

| Metric                                                       | Result |
| ------------------------------------------------------------ | -----: |
| Cleaned observations                                         |  3,338 |
| Unique cities represented                                    |    273 |
| Unique monitoring stations                                   |    526 |
| Stations with complete measurements for all seven pollutants |    377 |

The clustering analysis retained 377 stations with complete measurements for all seven pollutant features.

### K-Means Clustering

K-means clustering was applied to standardized pollutant measurements using three clusters.

| Cluster   | Number of stations | General observation                                                             |
| --------- | -----------------: | ------------------------------------------------------------------------------- |
| Cluster 1 |                 68 | Higher average PM2.5, PM10, CO, and NO2 measurements                            |
| Cluster 2 |                108 | Intermediate particulate measurements and the highest average ozone measurement |
| Cluster 3 |                201 | Lower average particulate, CO, and NO2 measurements                             |

The cluster numbers are algorithm-generated identifiers and do not represent an official ranking.

These groups describe similarities in the selected pollutant measurements. They are not official air quality categories or health-risk classifications. The results also depend on the selected features, preprocessing, scaling, and number of clusters.

## Visualizations

The project generates the following plots:

| File                       | Description                                         |
| -------------------------- | --------------------------------------------------- |
| `pollutant_counts.png`     | Number of observations available for each pollutant |
| `pollutant_averages.png`   | Average measurements for each pollutant             |
| `top_10_cities.png`        | City-level observations included in the analysis    |
| `air_quality_clusters.png` | Visualization of the resulting clusters             |

The generated images are stored in the `plots/` directory.

**Interpretation note:** Pollutants can have different measurement units, distributions, and health implications. Their numerical averages should not be compared directly as equivalent measures of risk.

## Project Structure

```text
AirAware/
├── README.md
├── .gitignore
├── AirAware.Rproj
├── R/
│   ├── 01_data_cleaning.R
│   ├── 02_exploratory_analysis.R
│   ├── 03_anomaly_detection.R
│   └── 04_kmeans_clustering.R
├── data/
│   └── Local source and generated CSV files
└── plots/
    ├── pollutant_counts.png
    ├── pollutant_averages.png
    ├── top_10_cities.png
    └── air_quality_clusters.png
```

The `data/` directory contains local datasets and generated analysis files. CSV files are excluded from the initial Git upload and therefore may not appear in the repository on GitHub.

## Installation and Usage

### Prerequisites

Install the following software:

* [R](https://cran.r-project.org/)
* [RStudio Desktop](https://posit.co/download/rstudio-desktop/)

Git is required only if you intend to clone or manage the repository through Git.

### Step 1: Obtain the Dataset

Download the air quality dataset from the official OGD resource.

Create a `data/` directory in the project folder, if it does not already exist, and save the source CSV as:

`data/air_quality_india.csv`

Check the applicable licence before redistributing the original dataset or generated files containing source observations.

### Step 2: Open the Project

Open `AirAware.Rproj` in RStudio.

Keep the expected project directory structure intact so the scripts can locate the input and output files.

### Step 3: Run the Scripts in Order

Execute the following scripts sequentially:

1. `R/01_data_cleaning.R`
2. `R/02_exploratory_analysis.R`
3. `R/03_anomaly_detection.R`
4. `R/04_kmeans_clustering.R`

Each stage may depend on files generated by earlier stages. Run the cleaning script first and confirm that the expected output files are created before continuing.

### Step 4: Inspect the Results

Review the generated CSV files in `data/` and the visualization images in `plots/`.

If a script reports a missing file or package, inspect the error message and verify that the dataset is in the expected location and that the required R packages are installed.

The scripts may require minor adjustments if their file paths or dependencies differ from the local environment.

## Limitations

* The analysis uses a downloaded dataset snapshot rather than a continuous historical dataset.
* The results describe that snapshot and do not represent current air quality conditions.
* Missing observations and incomplete monitoring station coverage may affect the findings.
* The IQR method flags statistical outliers and does not establish whether an observation represents an environmental emergency.
* K-means results depend on feature selection, scaling, the chosen number of clusters, and the observations available.
* Cluster labels are exploratory identifiers, not official air quality classifications.
* Pollutant units and measurement conditions should be verified before interpreting numerical comparisons.
* The analysis does not establish causal relationships or predict future air pollution levels.
* Results depend on the quality, coverage, and reliability of the source observations.

## Future Enhancements

* Develop an interactive dashboard for exploring pollutant measurements and station-level results.
* Add geographic maps to visualize monitoring station locations.
* Compare measurements across dates using a suitable historical dataset.
* Investigate additional statistical and machine learning methods for anomaly detection.
* Evaluate alternative clustering algorithms and cluster counts.
* Explore time-series forecasting when reliable historical observations are available.
* Improve reproducibility through dependency documentation and automated validation.
* Develop an accessible interface for students and community users.

## Learning Outcomes

This project provided practical experience with:

* Data cleaning and preprocessing in R.
* Exploratory data analysis and descriptive statistics.
* Data visualization.
* Statistical anomaly detection using the IQR method.
* Feature scaling and K-means clustering.
* Interpretation of unsupervised machine learning results.
* Organizing a data analysis project using Git and GitHub.

## Data Attribution and Licensing

**Dataset:** Real Time Air Quality Index from Various Locations
**Provider:** Central Pollution Control Board (CPCB), Government of India
**Official resource:** [data.gov.in](https://www.data.gov.in/resource/real-time-air-quality-index-various-locations)

The licence applicable to the specific dataset resource must be verified before redistributing the original dataset or generated files containing source data. Follow the applicable attribution and reuse conditions.

AirAware is an independent educational project and is not affiliated with or endorsed by the Government of India or CPCB.

## Author

**Shriya Dubey**
B.Tech Computer Science and Engineering

Interested in data science, machine learning, and technology for environmental and social impact.

---

*AirAware is an educational project. Its outputs are intended for exploratory analysis and should not be used as a substitute for official air quality advisories or professional environmental assessments.*
