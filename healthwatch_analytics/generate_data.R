# Synthetic Infectious Disease Surveillance Data Generator
# This script generates artificial data for demonstration purposes only
# All data is synthetic and does not represent real health surveillance information

# Load required libraries
library(tidyverse)
library(lubridate)

# Set seed for reproducibility
set.seed(42)

# Define parameters
n_weeks <- 52  # One year of data
n_regions <- 8  # 8 regions to get exactly 400 rows (52 * 8 = 416, we'll sample 400)

# Create regions (UK-style regional names)
regions <- c("North East", "North West", "Yorkshire", "East Midlands", 
             "West Midlands", "South East", "South West", "London")

# Define disease types with seasonal patterns
diseases <- c("Influenza", "Norovirus", "RSV", "COVID-19", "Whooping Cough")

# Generate base data structure
surveillance_data <- tibble(
  region = rep(regions, each = n_weeks),
  week_number = rep(1:n_weeks, times = length(regions))
) %>%
  # Add seasonal disease assignment (diseases have different peak seasons)
  mutate(
    disease_type = case_when(
      week_number %in% 40:52 | week_number %in% 1:12 ~ sample(c("Influenza", "RSV"), 1, prob = c(0.7, 0.3)),
      week_number %in% 10:20 ~ sample(c("Whooping Cough", "COVID-19"), 1, prob = c(0.4, 0.6)),
      week_number %in% 45:52 | week_number %in% 1:8 ~ sample(c("Norovirus", "Influenza"), 1, prob = c(0.6, 0.4)),
      TRUE ~ sample(diseases, 1)
    )
  ) %>%
  # Add population at risk (varies by region)
  mutate(
    population_at_risk = case_when(
      region == "London" ~ sample(850000:950000, 1),
      region == "North West" ~ sample(680000:750000, 1),
      region == "South East" ~ sample(620000:700000, 1),
      region == "Yorkshire" ~ sample(450000:520000, 1),
      region == "West Midlands" ~ sample(420000:480000, 1),
      region == "East Midlands" ~ sample(380000:440000, 1),
      region == "South West" ~ sample(350000:420000, 1),
      region == "North East" ~ sample(280000:340000, 1)
    )
  ) %>%
  # Generate case counts with realistic patterns
  mutate(
    # Base case rate per 100k population
    base_rate = case_when(
      disease_type == "Influenza" ~ ifelse(week_number %in% c(40:52, 1:12), 
                                         runif(1, 45, 85), runif(1, 5, 25)),
      disease_type == "Norovirus" ~ ifelse(week_number %in% c(45:52, 1:8), 
                                          runif(1, 35, 65), runif(1, 8, 20)),
      disease_type == "RSV" ~ ifelse(week_number %in% c(42:52, 1:10), 
                                    runif(1, 25, 45), runif(1, 2, 12)),
      disease_type == "COVID-19" ~ runif(1, 15, 35),
      disease_type == "Whooping Cough" ~ ifelse(week_number %in% 10:20, 
                                               runif(1, 8, 18), runif(1, 1, 6))
    ),
    # Calculate actual case counts
    case_count = round((base_rate * population_at_risk) / 100000)
  ) %>%
  # Add some realistic noise
  mutate(
    case_count = pmax(0, case_count + sample(-20:20, n(), replace = TRUE))
  ) %>%
  # Select and reorder columns
  select(region, disease_type, week_number, case_count, population_at_risk)

# Sample exactly 400 rows and ensure good distribution
final_data <- surveillance_data %>%
  group_by(region, disease_type) %>%
  slice_sample(n = 50) %>%
  ungroup() %>%
  slice_sample(n = 400) %>%
  arrange(region, week_number)

# Save to CSV
write_csv(final_data, "healthwatch_analytics/surveillance_data.csv")

# Display summary
cat("Generated surveillance dataset with", nrow(final_data), "rows and", ncol(final_data), "columns\n")
cat("Regions:", length(unique(final_data$region)), "\n")
cat("Disease types:", length(unique(final_data$disease_type)), "\n")
cat("Week range:", min(final_data$week_number), "to", max(final_data$week_number), "\n")
cat("Case count range:", min(final_data$case_count), "to", max(final_data$case_count), "\n")