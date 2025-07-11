# Posit Demo Data Generator

This document provides instructions for using Claude to generate demonstration data for Positron tailored to customers or industries. The input is a customer / prospect's company name, status (current or potential customer), and selected features. Claude will create synthetic data that is specifically designed for exploratory data analysis (EDA), plot and table creation, and interactive application development. **The example data and analysis should be created for an imaginary company in an industry relevant to the provided customer. Ensure that the company name and data are clearly artificial and generated through AI.** The goal is to create a simple dataset that can higlight the capabilities of Positron Assistant and Datbot for LLM assisted data analysis.

## Overview

The goal is to create a simple, synthetic data with the following specifications:

- data is relevant to the customer's industry
- data is clean and free of errors
- data is small with no more than 5 columns and 500 rows
- data contains a mix of numerical and categorical variables
- data is well suited for exploratory data analysis (EDA) and visualization
- data contains obvious trends and relationships that can be easily demonstrated
- data resides inside a subdirectory named after the synthetic company name in the project root directory

## Project Plan
@.claude/PLAN.md

## Key Deliverables
### 1. Synthetic Data
- Industry-relevant synthetic dataset in CSV format
- Data should be small. No more than 500 rows and 5 columns
- Realistic structure and relationships
- Contains a mix of numerical and categorical variables
- Contains obvious trends and relationships that can be easily demonstrated
- Generated programmatically for reproducibility
- While data should be realistic, it should be clearly artificial and generated through AI. Do not use real names of people or company products in the data. Use names that are clearly artificial.

  - Example: For a retail company, use product names like "Widget A" or "Gadget X" instead of real products. 

## Success Metrics

A successful data set should:
- Be simple enough that customers don't get lost and clearly understand columns and data types
- Be relevant to the customer's industry and use case
- Work seamlessly with Positron Assistant and Databot
- **Avoid complexity**
- Generate enthusiasm for further engagement with demonstrated capabilities
