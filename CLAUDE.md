# Posit Demo Data Generator

This document provides instructions for using Claude to generate demonstration data for Positron demos tailored to customers or industries. Claude will create synthetic data specifically designed for exploratory data analysis (EDA), plot and table creation, and interactive application development to highlight the capabilities of Positron Assistant and Databot.

## Purpose

Create simple, synthetic datasets for imaginary companies in industries relevant to provided customers. The data should be clean, **small (300-500 rows, max 5 columns)**, and contain obvious trends perfect for demonstrating Positron's capabilities.

**IMPORTANT: Keep datasets small for effective demos - larger datasets can overwhelm customers and obscure key insights.**

## Project Workflow
See @.claude/PLAN.md for detailed process steps and requirements.

## Key Deliverables

### Synthetic Dataset
- **SIZE REQUIREMENT: 300-500 rows, max 5 columns**
- Industry-relevant CSV file 
- Mix of numerical and categorical variables with clear trends
- Generated programmatically using R/tidyverse
- Stored in subdirectory named after fictional company
- Clearly artificial data (no real names/products)

### Updated README Index
- After each dataset creation, automatically scan the root directory and update the README.md file with a fresh index of all available datasets
- Include dataset descriptions and column information for easy reference
- Remove any datasets from the README index that no longer exist in the directory (cleanup deleted datasets)

## Success Criteria

A successful dataset should:
- Be simple and immediately understandable
- Be relevant to customer's industry and use case
- Work seamlessly with Positron Assistant and Databot
- **Avoid complexity**
- Generate enthusiasm for further engagement
