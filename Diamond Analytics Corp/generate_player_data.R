# Synthetic Baseball Player Analytics Data Generator
# This data is AI-generated and synthetic for demonstration purposes only
# Created for Diamond Analytics Corp - a fictional company

# Install required packages
if (!require("pak")) install.packages("pak")
pak::pak(c("tidyverse", "readr"))

library(tidyverse)
library(readr)

# Set seed for reproducibility
set.seed(42)

# Generate synthetic player data
n_players <- 400

# Create fictional player names - expanded lists to reduce duplicates
first_names <- c("Mike", "Jake", "Luis", "Carlos", "Tommy", "Alex", "Ryan", "Jose", "David", "Matt",
                "Chris", "Tony", "Sam", "Nick", "Ben", "Tyler", "Derek", "Kevin", "Mark", "Steve",
                "James", "Robert", "John", "Michael", "William", "Richard", "Joseph", "Daniel", "Anthony",
                "Brian", "Jason", "Scott", "Paul", "Justin", "Eric", "Jonathan", "Adam", "Andrew", "Kenneth")
last_names <- c("Rodriguez", "Johnson", "Smith", "Garcia", "Martinez", "Brown", "Davis", "Wilson", 
               "Miller", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", 
               "Martin", "Thompson", "Lee", "Clark", "Lewis", "Robinson", "Walker", "Young", "King",
               "Wright", "Lopez", "Hill", "Green", "Adams", "Baker", "Nelson", "Carter", "Mitchell",
               "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards")

player_data <- tibble(
  player_name = paste(
    sample(first_names, n_players, replace = TRUE),
    sample(last_names, n_players, replace = TRUE)
  ),
  
  position = sample(c("OF", "IF", "C", "P"), n_players, replace = TRUE, 
                   prob = c(0.35, 0.35, 0.15, 0.15)),
  
  batting_avg = round(rnorm(n_players, mean = 0.265, sd = 0.035), 3),
  
  home_runs = case_when(
    position == "P" ~ rpois(n_players, lambda = 0.5),
    position == "C" ~ rpois(n_players, lambda = 12),
    TRUE ~ rpois(n_players, lambda = 18)
  ),
  
  ops = round(batting_avg + rnorm(n_players, mean = 0.475, sd = 0.075), 3)
)

# Clean the data to ensure realistic values
player_data <- player_data %>%
  mutate(
    batting_avg = pmax(0.150, pmin(0.400, batting_avg)),
    home_runs = pmax(0, home_runs),
    ops = pmax(0.400, pmin(1.200, ops))
  ) %>%
  # Remove any duplicate names
  distinct(player_name, .keep_all = TRUE) %>%
  # Ensure we have 400 rows for demo requirements
  slice_head(n = 400)

# Write to CSV without comments (per PLAN.md requirements)
write_csv(player_data, "player_analytics.csv")

# Display summary
print("Data generation complete!")
print(paste("Generated", nrow(player_data), "player records"))
print("Data preview:")
print(head(player_data))