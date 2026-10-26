# AirAware - Exploratory Data Analysis

library(tidyverse)

# Load cleaned dataset
clean_data <- read.csv("data/air_quality_cleaned.csv")

# Display dataset information
cat("Cleaned Dataset Dimensions:\n")
print(dim(clean_data))

# 1. Count records for each pollutant
pollutant_counts <- clean_data %>%
  count(pollutant_id, sort = TRUE)

print(pollutant_counts)

# Plot pollutant counts
plot1 <- ggplot(pollutant_counts,
                aes(x = reorder(pollutant_id, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Number of Records by Pollutant",
    x = "Pollutant",
    y = "Number of Records"
  ) +
  theme_minimal()

print(plot1)

ggsave("plots/pollutant_counts.png",
       plot = plot1,
       width = 8,
       height = 6)

# 2. Average recorded reading for each pollutant
pollutant_averages <- clean_data %>%
  group_by(pollutant_id) %>%
  summarise(
    mean_reading = mean(pollutant_avg, na.rm = TRUE),
    .groups = "drop"
  )

print(pollutant_averages)

# Plot average readings
plot2 <- ggplot(pollutant_averages,
                aes(x = reorder(pollutant_id, mean_reading),
                    y = mean_reading)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Mean Recorded Reading by Pollutant",
    x = "Pollutant",
    y = "Mean Reading (pollutant-specific units)"
  ) +
  theme_minimal()

print(plot2)

ggsave("plots/pollutant_averages.png",
       plot = plot2,
       width = 8,
       height = 6)

# 3. Cities with the most pollutant records
city_counts <- clean_data %>%
  count(city, sort = TRUE) %>%
  slice_head(n = 10)

print(city_counts)

# Plot top 10 cities by record count
plot3 <- ggplot(city_counts,
                aes(x = reorder(city, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 10 Cities by Number of Pollutant Records",
    x = "City",
    y = "Number of Records"
  ) +
  theme_minimal()

print(plot3)

ggsave("plots/top_10_cities.png",
       plot = plot3,
       width = 9,
       height = 6)

cat("\nEDA completed! Graphs saved in the plots folder.\n")


