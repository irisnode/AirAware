# AirAware - Anomaly Detection

library(tidyverse)

# Load cleaned dataset
clean_data <- read.csv("data/air_quality_cleaned.csv")

# Detect unusually high readings for each pollutant
anomalies <- clean_data %>%
  group_by(pollutant_id) %>%
  mutate(
    Q1 = quantile(pollutant_avg, 0.25, na.rm = TRUE),
    Q3 = quantile(pollutant_avg, 0.75, na.rm = TRUE),
    IQR_value = IQR(pollutant_avg, na.rm = TRUE),
    upper_limit = Q3 + 1.5 * IQR_value,
    is_anomaly = pollutant_avg > upper_limit
  ) %>%
  ungroup() %>%
  filter(is_anomaly)

# Display detected anomalies
cat("Number of unusual readings detected:\n")
print(nrow(anomalies))

# Show the 10 highest flagged readings
top_anomalies <- anomalies %>%
  arrange(desc(pollutant_avg)) %>%
  select(city, state, pollutant_id, pollutant_avg, upper_limit) %>%
  slice_head(n = 10)

print(top_anomalies)

# Save anomaly results
write.csv(
  anomalies,
  "data/air_quality_anomalies.csv",
  row.names = FALSE
)

cat("\nAnomaly detection completed!\n")

