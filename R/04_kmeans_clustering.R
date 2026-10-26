# AirAware - K-means Clustering

library(tidyverse)

# Load cleaned dataset
clean_data <- read.csv("data/air_quality_cleaned.csv")

# Keep only stations with all seven pollutants
station_coverage <- clean_data %>%
  group_by(station, city, state) %>%
  summarise(
    pollutant_count = n_distinct(pollutant_id),
    .groups = "drop"
  )

complete_stations <- station_coverage %>%
  filter(pollutant_count == 7)

# Keep records from complete stations
complete_data <- clean_data %>%
  semi_join(
    complete_stations,
    by = c("station", "city", "state")
  )

# Create one row per station and one column per pollutant
station_data <- complete_data %>%
  group_by(station, city, state, pollutant_id) %>%
  summarise(
    reading = mean(pollutant_avg, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  pivot_wider(
    names_from = pollutant_id,
    values_from = reading
  )

# Remove stations with any remaining missing values
station_data <- station_data %>%
  drop_na()

# Display prepared dataset dimensions
cat("Prepared station dataset:\n")
print(dim(station_data))

# Separate station details from pollutant features
station_info <- station_data %>%
  select(station, city, state)

pollutant_features <- station_data %>%
  select(CO, NH3, NO2, OZONE, PM10, `PM2.5`, SO2)

# Standardise pollutant features
scaled_features <- scale(pollutant_features)

# Set seed for reproducible results
set.seed(123)

# Apply K-means clustering with three groups
kmeans_model <- kmeans(
  scaled_features,
  centers = 3,
  nstart = 25
)

# Add cluster labels to station details
cluster_results <- station_info %>%
  mutate(cluster = factor(kmeans_model$cluster))

# Display number of stations in each cluster
cat("\nStations in each cluster:\n")
print(count(cluster_results, cluster))

# Display cluster averages in original measurement scales
cluster_profiles <- pollutant_features %>%
  mutate(cluster = factor(kmeans_model$cluster)) %>%
  group_by(cluster) %>%
  summarise(
    across(everything(), ~ round(mean(.x), 2)),
    .groups = "drop"
  )

cat("\nAverage pollutant readings by cluster:\n")
print(cluster_profiles)

# Save cluster assignments
write.csv(
  cluster_results,
  "data/air_quality_clusters.csv",
  row.names = FALSE
)

# Save cluster profiles
write.csv(
  cluster_profiles,
  "data/cluster_profiles.csv",
  row.names = FALSE
)

cat("\nK-means clustering completed successfully!\n")


# Visualise pollution clusters

cluster_plot_data <- cluster_results %>%
  mutate(
    PM25 = pollutant_features$`PM2.5`,
    PM10 = pollutant_features$PM10
  )

cluster_plot <- ggplot(
  cluster_plot_data,
  aes(x = PM25, y = PM10, color = cluster)
) +
  geom_point(size = 2, alpha = 0.7) +
  labs(
    title = "AirAware: Air Quality Clusters",
    subtitle = "Monitoring stations grouped using K-means",
    x = "PM2.5 Reading",
    y = "PM10 Reading",
    color = "Cluster"
  ) +
  theme_minimal()

print(cluster_plot)

ggsave(
  "plots/air_quality_clusters.png",
  plot = cluster_plot,
  width = 9,
  height = 6
)

cat("\nCluster visualisation saved successfully!\n")

# Identify cities in each cluster

city_clusters <- cluster_results %>%
  group_by(cluster) %>%
  summarise(
    total_cities = n_distinct(city),
    cities = paste(sort(unique(city)), collapse = ", "),
    .groups = "drop"
  )

cat("\nCities grouped by cluster:\n")
print(city_clusters, width = Inf)

# Save city cluster information
write.csv(
  city_clusters,
  "data/city_clusters.csv",
  row.names = FALSE
)

# Find the 10 stations with the highest PM2.5 readings

top_pm25_stations <- station_data %>%
  arrange(desc(`PM2.5`)) %>%
  select(station, city, state, `PM2.5`) %>%
  head(10)

cat("\nTop 10 stations by PM2.5 readings:\n")
print(top_pm25_stations, width = Inf)

write.csv(
  top_pm25_stations,
  "data/top_pm25_stations.csv",
  row.names = FALSE
)


