# AirAware - Data Cleaning

library(tidyverse)

# Load dataset
data <- read.csv("data/air_quality_india.csv")

# Check dataset dimensions
cat("Original dataset dimensions:\n")
print(dim(data))

# Check column names
cat("\nColumn names:\n")
print(names(data))

# Check missing values
cat("\nMissing values in each column:\n")
print(colSums(is.na(data)))

# Check duplicate rows
cat("\nNumber of duplicate rows:\n")
print(sum(duplicated(data)))

# Convert pollutant measurements to numeric
data$pollutant_min <- as.numeric(data$pollutant_min)
data$pollutant_max <- as.numeric(data$pollutant_max)
data$pollutant_avg <- as.numeric(data$pollutant_avg)

# Convert coordinates to numeric
data$latitude <- as.numeric(data$latitude)
data$longitude <- as.numeric(data$longitude)

# Remove exact duplicate rows
clean_data <- data %>%
  distinct()

# Remove rows with missing essential values
clean_data <- clean_data %>%
  filter(
    !is.na(city),
    !is.na(pollutant_id),
    !is.na(pollutant_avg),
    !is.na(latitude),
    !is.na(longitude)
  )

# Check for invalid pollutant measurements
clean_data <- clean_data %>%
  filter(
    pollutant_avg >= 0,
    latitude >= -90,
    latitude <= 90,
    longitude >= -180,
    longitude <= 180
  )

# Display cleaned dataset dimensions
cat("\nCleaned dataset dimensions:\n")
print(dim(clean_data))

# Preview cleaned data
head(clean_data)

# Save cleaned dataset
write.csv(
  clean_data,
  "data/air_quality_cleaned.csv",
  row.names = FALSE
)

cat("\nCleaned dataset saved successfully!\n")

