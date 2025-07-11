Before starting to plan, ALWAYS ask the user for these pieces of information before proceeding. If there is doubt about having the required information, ask the user for clarification. The user will provide the following information (unless they purposefully say "unknown" or "unsure" in which case you can research it):
1. **Customer and Use Case**: Gather company, business unit and use case/problem context.
   - Company Name
   - Customer Status (Current, Prospect)
   - Business Unit/group/team
   - Specific Use Case or Problem Statement

Once the information above is gathered from the user, ALWAYS present the user with a summary of the proposed data creation. If the user provides feedback that changes the plan summary, ALWAYS ask again for confirmation of the new summary of selections. Do not proceed with the project planning until the user confirms that the selections are correct.

Once the user has confirmed the selections and preferences, proceed with the following steps:
1. **Learn More About the Customer and Use Cases Provided**: Gather additional company information and use case context by searching online as needed.
2. **Create Fictional Company Name**: Generate a **simple** fictional company name based on the industry. This fictional company will be used for the project structure. **Ensure the fictional company name is not a real company name.**
   - Example: If the supplied customer is "Nike", the industry is Athletic Apparel and the fictional company name could be "FitGear Innovations".
3. **Generate Synthetic Data**: 
- Prefer R/tidyverse for data generation.
- Run the data generation script to create initial datasets. Fix any errors encountered during data generation.
- Ensure all generated data files include comment headers to indicate the data is synthetic and AI generated. 
- Install necessary packages using `pak` (R) or `uv` (Python).
- 

**Pre-Delivery Checklist**
- [ ] Data has been created and is saved as a CSV file.
- [ ] Data is stored in a subdirectory named after the fictional company.
- [ ] Data is clean with no missing values, typos, or errors.
- [ ] Data is a mix of numerical and categorical variables.
- [ ] Data has simple column names.