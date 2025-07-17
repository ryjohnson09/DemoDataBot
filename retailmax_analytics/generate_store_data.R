# Synthetic Store Performance Data Generation Script
# Company: RetailMax Analytics (Fictional)
# Customer: Walmart - Supply Chain & Inventory Analytics
# Use Case: Store performance optimization and inventory management
# Generated for demonstration purposes only - all data is synthetic

# Load required libraries
if (!require("pak", quietly = TRUE)) {
  install.packages("pak")
}
pak::pak(c("tidyverse", "lubridate"))

library(tidyverse)
library(lubridate)

# Set seed for reproducibility
set.seed(42)

# Generate synthetic store performance data
# 400 rows (100 stores × 4 quarters), 5 columns max

# Define parameters
n_stores <- 100
n_quarters <- 4
regions <- c("Northeast", "Southeast", "Midwest", "West")

# Generate store data
store_data <- expand_grid(
  store_id = paste0("ST", str_pad(1:n_stores, 4, pad = "0")),
  quarter = 1:n_quarters
) %>%
  mutate(
    # Assign regions with realistic distribution
    store_num = as.numeric(str_sub(store_id, 3, 6)),
    region = case_when(
      store_num <= 25 ~ "Northeast",
      store_num <= 50 ~ "Southeast", 
      store_num <= 75 ~ "Midwest",
      TRUE ~ "West"
    ),
    
    # Generate monthly sales with regional and seasonal variations
    base_sales = case_when(
      region == "Northeast" ~ rnorm(n(), 2.8, 0.4),
      region == "Southeast" ~ rnorm(n(), 3.2, 0.5),
      region == "Midwest" ~ rnorm(n(), 2.5, 0.3),
      region == "West" ~ rnorm(n(), 3.8, 0.6)
    ),
    
    # Add seasonal variation (Q4 higher for holidays)
    seasonal_multiplier = case_when(
      quarter == 1 ~ 0.9,
      quarter == 2 ~ 1.0,
      quarter == 3 ~ 1.1,
      quarter == 4 ~ 1.3
    ),
    
    monthly_sales = round(pmax(base_sales * seasonal_multiplier, 0.5), 1),
    
    # Generate inventory turnover (higher sales generally = higher turnover)
    inventory_turnover = round(pmax(
      rnorm(n(), 4.5, 0.8) + (monthly_sales - 3) * 0.3, 
      2.0
    ), 1),
    
    # Generate customer traffic (correlated with sales but with some variation)
    customer_traffic = round(pmax(
      monthly_sales * rnorm(n(), 18, 3) + rnorm(n(), 10, 5),
      20
    ), 0)
  ) %>%
  select(store_id, region, monthly_sales, inventory_turnover, customer_traffic) %>%
  arrange(store_id)

# Verify data meets requirements
cat("Dataset Summary:\n")
cat("Rows:", nrow(store_data), "\n")
cat("Columns:", ncol(store_data), "\n")
cat("Missing values:", sum(is.na(store_data)), "\n")
cat("\nColumn types:\n")
print(sapply(store_data, class))

cat("\nRegional distribution:\n")
print(table(store_data$region))

cat("\nSample data:\n")
print(head(store_data, 10))

# Save the dataset
write_csv(store_data, "store_performance.csv")
cat("\nDataset saved as 'store_performance.csv'\n")