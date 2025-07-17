# MediCore Therapeutics Clinical Trial Data Generator
# This script generates synthetic clinical trial data for demonstration purposes
# Data is completely artificial and created by AI for Positron demo

# Set seed for reproducibility
set.seed(42)

# Generate 400 records of clinical trial data
n_records <- 400

# Create synthetic trial data
trial_data <- data.frame(
  Trial_ID = paste0("MCT-", sprintf("%04d", 1:n_records)),
  Drug_Compound = sample(c("CardioMax-A", "HeartGuard-B", "VascuFlow-C", 
                          "CirculatePro-D", "PulseRx-E"), n_records, replace = TRUE),
  Patient_Count = sample(50:500, n_records, replace = TRUE),
  Efficacy_Score = round(runif(n_records, min = 0.2, max = 0.95), 3),
  Trial_Phase = sample(c("Phase I", "Phase II", "Phase III"), n_records, 
                      replace = TRUE, prob = c(0.3, 0.4, 0.3))
)

# Add some realistic correlations
# Higher phase trials tend to have more patients
trial_data$Patient_Count[trial_data$Trial_Phase == "Phase III"] <- 
  sample(200:500, sum(trial_data$Trial_Phase == "Phase III"), replace = TRUE)

trial_data$Patient_Count[trial_data$Trial_Phase == "Phase I"] <- 
  sample(50:150, sum(trial_data$Trial_Phase == "Phase I"), replace = TRUE)

# Phase III trials tend to have slightly lower efficacy scores (more realistic)
trial_data$Efficacy_Score[trial_data$Trial_Phase == "Phase III"] <- 
  round(runif(sum(trial_data$Trial_Phase == "Phase III"), min = 0.2, max = 0.8), 3)

# Write to CSV with header comment
write.csv(trial_data, "MediCore-Therapeutics/clinical_trials.csv", row.names = FALSE)

cat("Generated", nrow(trial_data), "records of synthetic clinical trial data\n")
cat("Data saved to: MediCore-Therapeutics/clinical_trials.csv\n")
cat("Columns:", paste(names(trial_data), collapse = ", "), "\n")