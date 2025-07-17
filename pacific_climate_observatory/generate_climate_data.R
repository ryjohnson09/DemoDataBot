# Pacific Climate Observatory - Synthetic Weather Data Generator
# This script generates synthetic weather station data for demonstration purposes
# Data is completely artificial and created for Positron demo purposes only

# Install required packages
if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

pak::pkg_install(c("dplyr", "readr", "lubridate"))

library(dplyr)
library(readr)
library(lubridate)

# Set seed for reproducibility
set.seed(42)

# Generate synthetic weather station data
# This represents daily weather observations over 100 days (400 total rows for demo)
generate_climate_data <- function() {
  # Create date sequence for a smaller demo dataset (400 rows total across 4 stations = 100 days)
  dates <- seq(from = as.Date("2023-01-01"), to = as.Date("2023-04-10"), by = "day")
  n_days <- length(dates)
  
  # Generate synthetic temperature data with seasonal patterns
  # Base temperature around 65°F with seasonal variation
  day_of_year <- as.numeric(format(dates, "%j"))
  seasonal_temp <- 65 + 20 * sin(2 * pi * (day_of_year - 80) / 365)
  temperature_f <- seasonal_temp + rnorm(n_days, 0, 5)
  
  # Generate precipitation data (more realistic with many zero days)
  # Higher precipitation in winter months
  seasonal_precip_prob <- 0.3 + 0.2 * sin(2 * pi * (day_of_year - 80) / 365)
  has_precip <- rbinom(n_days, 1, seasonal_precip_prob)
  precipitation_inches <- ifelse(has_precip, rexp(n_days, 3), 0)
  precipitation_inches <- pmin(precipitation_inches, 5) # Cap at 5 inches
  
  # Generate atmospheric pressure (typical range 29.80-30.20 inHg)
  pressure_base <- 30.0 + 0.1 * sin(2 * pi * day_of_year / 365)
  pressure_inhg <- pressure_base + rnorm(n_days, 0, 0.05)
  
  # Generate wind speed (mph) with some correlation to pressure changes
  wind_speed_mph <- 8 + 5 * (1 - (pressure_inhg - 29.9) / 0.3) + rnorm(n_days, 0, 2)
  wind_speed_mph <- pmax(wind_speed_mph, 0) # No negative wind speeds
  
  # Create station names (clearly artificial)
  stations <- c("Station_Alpha", "Station_Beta", "Station_Gamma", "Station_Delta")
  
  # Replicate data for multiple stations with slight variations
  weather_data <- data.frame()
  
  for (station in stations) {
    station_data <- data.frame(
      date = dates,
      station = station,
      temperature_f = temperature_f + rnorm(n_days, 0, 2), # Station-specific variation
      precipitation_inches = precipitation_inches,
      pressure_inhg = pressure_inhg + rnorm(n_days, 0, 0.02)
    )
    weather_data <- rbind(weather_data, station_data)
  }
  
  # Round to realistic precision
  weather_data <- weather_data %>%
    mutate(
      temperature_f = round(temperature_f, 1),
      precipitation_inches = round(precipitation_inches, 2),
      pressure_inhg = round(pressure_inhg, 2)
    ) %>%
    arrange(date, station)
  
  return(weather_data)
}

# Generate the dataset
climate_data <- generate_climate_data()

# Save to CSV
write_csv(climate_data, "pacific_climate_observatory/weather_data.csv")

# Display summary
cat("Generated", nrow(climate_data), "weather observations\n")
cat("Date range:", min(climate_data$date), "to", max(climate_data$date), "\n")
cat("Stations:", paste(unique(climate_data$station), collapse = ", "), "\n")
cat("Data saved to: pacific_climate_observatory/weather_data.csv\n")