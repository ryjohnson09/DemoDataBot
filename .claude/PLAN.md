# Demo Data Generation Workflow

## Phase 1: Information Gathering

**ALWAYS ask the user for these pieces of information before proceeding:**
1. **Customer and Use Case**:
   - Company Name
   - Customer Status (Current, Prospect)
   - Business Unit/group/team
   - Specific Use Case or Problem Statement

**ALWAYS present a summary of the proposed data creation and get user confirmation before proceeding.**

## Phase 2: Research and Planning

1. **Learn More About the Customer**: Gather additional company information and use case context by searching online as needed.

2. **Create Fictional Company Name**: Generate a **simple** fictional company name based on the industry. 
   - Example: If the customer is "Nike", the fictional company could be "FitGear Innovations"
   - **Ensure the fictional company name is not a real company name**

## Phase 3: Data Generation

**CRITICAL SIZE REQUIREMENT: 300-500 rows, max 5 columns**
**Remember: Small datasets are better for demos than comprehensive ones!**

**Technical Requirements:**
- Prefer R/tidyverse for data generation
- Install necessary packages using `pak` (R)
- Run the data generation script and fix any errors encountered
- Ensure the data generation script contains comments highlighting that the data is synthetic and generated for demonstration purposes
- Do not include any comments in the generated data itself

**Data Specifications:**
- Industry-relevant synthetic dataset in CSV format
- **MUST BE between 300 and 500 rows, with no more than 5 columns**
- Mix of numerical and categorical variables (at least one of each)
- Clean data with no missing values, typos, or errors
- Simple column names
- Contains obvious trends and relationships that can be easily demonstrated
- Well-suited for EDA and visualization
- Clearly artificial data (no real names of people or company products)
- Stored in subdirectory named after fictional company (no spaces or special characters, use underscores)

## Phase 4: Documentation Update

**ALWAYS complete this step after successful data generation:**

1. **Update README Index**: After creating each dataset, automatically scan the root directory and update the README.md file with a fresh index of all available datasets
2. **Include Dataset Information**: For each dataset, include:
   - Dataset description and use case
   - Column names and data types
   - Industry/domain categorization
   - File location and structure

## Pre-Delivery Checklist

- [ ] Data has been created and is saved as a CSV file
- [ ] Data is stored in a subdirectory named after the fictional company
- [ ] Data is clean with no missing values, typos, or errors
- [ ] Data is a mix of numerical and categorical variables
- [ ] Data has simple column names
- [ ] Data contains obvious trends and relationships
- [ ] **CRITICAL: Data is small (between 300 and 500 rows, with no more than 5 columns)**
- [ ] Data is well-suited for EDA and visualization
- [ ] Data does not contain any comments
- [ ] Subdirectory name contains no spaces or special characters
- [ ] **README.md has been updated with the new dataset in the index**