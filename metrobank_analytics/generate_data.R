# Synthetic Credit Risk Portfolio Data Generator
# This script generates artificial banking data for demonstration purposes only
# All data is synthetic and does not represent real financial information

# Load required libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Define parameters
n_quarters <- 18  # 4.5 years of quarterly data
n_loan_types <- 5  # 5 different loan types
target_rows <- 450  # Target dataset size

# Define loan types
loan_types <- c("Mortgages", "Credit Cards", "Auto Loans", "Personal Loans", "Business Loans")

# Define risk grades
risk_grades <- c("AAA", "AA", "A", "BBB", "BB", "B", "CCC")

# Generate base data structure
portfolio_data <- expand_grid(
  loan_type = loan_types,
  risk_grade = risk_grades,
  quarter = 1:n_quarters
) %>%
  # Add realistic portfolio values based on loan type and risk grade
  mutate(
    base_portfolio_value = case_when(
      loan_type == "Mortgages" ~ case_when(
        risk_grade %in% c("AAA", "AA", "A") ~ runif(1, 800, 1200),
        risk_grade %in% c("BBB", "BB") ~ runif(1, 400, 600),
        TRUE ~ runif(1, 150, 300)
      ),
      loan_type == "Credit Cards" ~ case_when(
        risk_grade %in% c("AAA", "AA", "A") ~ runif(1, 200, 400),
        risk_grade %in% c("BBB", "BB") ~ runif(1, 150, 250),
        TRUE ~ runif(1, 50, 120)
      ),
      loan_type == "Auto Loans" ~ case_when(
        risk_grade %in% c("AAA", "AA", "A") ~ runif(1, 300, 500),
        risk_grade %in% c("BBB", "BB") ~ runif(1, 200, 350),
        TRUE ~ runif(1, 80, 180)
      ),
      loan_type == "Personal Loans" ~ case_when(
        risk_grade %in% c("AAA", "AA", "A") ~ runif(1, 100, 200),
        risk_grade %in% c("BBB", "BB") ~ runif(1, 80, 150),
        TRUE ~ runif(1, 30, 80)
      ),
      loan_type == "Business Loans" ~ case_when(
        risk_grade %in% c("AAA", "AA", "A") ~ runif(1, 400, 700),
        risk_grade %in% c("BBB", "BB") ~ runif(1, 250, 450),
        TRUE ~ runif(1, 100, 250)
      )
    )
  ) %>%
  # Add time trend and seasonality to portfolio values
  mutate(
    growth_factor = 1 + (quarter - 1) * 0.02 + sin(2 * pi * quarter / 4) * 0.05,
    portfolio_value = round(base_portfolio_value * growth_factor, 1)
  ) %>%
  # Generate realistic default rates based on risk grade and economic cycle
  mutate(
    # Economic cycle effect (recession around quarters 8-12)
    economic_stress = case_when(
      quarter %in% 8:12 ~ runif(1, 1.5, 2.5),
      quarter %in% 13:15 ~ runif(1, 1.2, 1.8),
      TRUE ~ runif(1, 0.8, 1.2)
    ),
    # Base default rates by risk grade
    base_default_rate = case_when(
      risk_grade == "AAA" ~ runif(1, 0.05, 0.15),
      risk_grade == "AA" ~ runif(1, 0.1, 0.3),
      risk_grade == "A" ~ runif(1, 0.2, 0.6),
      risk_grade == "BBB" ~ runif(1, 0.5, 1.2),
      risk_grade == "BB" ~ runif(1, 1.0, 2.5),
      risk_grade == "B" ~ runif(1, 2.0, 4.5),
      risk_grade == "CCC" ~ runif(1, 4.0, 8.0)
    ),
    # Loan type adjustment
    loan_type_factor = case_when(
      loan_type == "Mortgages" ~ runif(1, 0.6, 1.0),
      loan_type == "Credit Cards" ~ runif(1, 1.2, 1.8),
      loan_type == "Auto Loans" ~ runif(1, 0.8, 1.2),
      loan_type == "Personal Loans" ~ runif(1, 1.1, 1.6),
      loan_type == "Business Loans" ~ runif(1, 0.9, 1.4)
    ),
    # Final default rate
    default_rate = round(base_default_rate * economic_stress * loan_type_factor, 2)
  ) %>%
  # Select and reorder columns
  select(loan_type, risk_grade, quarter, default_rate, portfolio_value)

# Sample exactly 450 rows ensuring good distribution
final_data <- portfolio_data %>%
  # Ensure we have representation across all loan types and risk grades
  group_by(loan_type, risk_grade) %>%
  slice_sample(n = 3) %>%
  ungroup()

# If we need more rows, add them randomly
if (nrow(final_data) < 450) {
  remaining_rows <- 450 - nrow(final_data)
  additional_data <- portfolio_data %>%
    slice_sample(n = remaining_rows)
  final_data <- bind_rows(final_data, additional_data)
}

# Take exactly 450 rows and arrange
final_data <- final_data %>%
  slice_sample(n = 450) %>%
  arrange(loan_type, risk_grade, quarter)

# Save to CSV
write_csv(final_data, "metrobank_analytics/portfolio_risk_data.csv")

# Display summary
cat("Generated portfolio risk dataset with", nrow(final_data), "rows and", ncol(final_data), "columns\n")
cat("Loan types:", length(unique(final_data$loan_type)), "\n")
cat("Risk grades:", length(unique(final_data$risk_grade)), "\n")
cat("Quarter range:", min(final_data$quarter), "to", max(final_data$quarter), "\n")
cat("Default rate range:", min(final_data$default_rate), "% to", max(final_data$default_rate), "%\n")
cat("Portfolio value range: $", min(final_data$portfolio_value), "M to $", max(final_data$portfolio_value), "M\n")