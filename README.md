# DemoDataBot

DemoDataBot will create a synthetic data set optimized for EDA, visualization, and web app development. For more information about the data, please view the `CLAUDE.md` and `.claude/PLAN.md` files.

## Prerequisites

Demobot uses [Claude Code](https://www.anthropic.com/claude-code) to generate projects. To run Demobot, you need:

1.  **Node.js** - Required to run Claude Code (comes with `npx`)
2.  **Anthropic API Key** - Set the `ANTHROPIC_API_KEY` environment variable with your API key

## Usage

### Quick Start

1.  Open a terminal in this directory

2.  Start demobot by running Claude Code:

    ``` bash
    npx @anthropic-ai/claude-code
    ```

3.  Tell it to create a demo project for your customer:

    ```         
    > Create data for [Company Name].
    ```

4.  Answer the setup questions. If there are certain prompts that you don't know the answer to, you can call them out as "unknown" or "unsure" and Demobot will research them for you.

5.  Occasionally, Demobot may ask for confirmation or additional details. Respond as needed.

## Available Datasets

The following synthetic datasets have been generated for demonstration purposes:

### Healthcare & Life Sciences
- **`healthwatch_analytics/`** - Public health surveillance data
  - `surveillance_data.csv` - Disease surveillance across regions and time periods
  - Columns: region, disease_type, week_number, case_count, population_at_risk

- **`MediCore-Therapeutics/`** - Clinical trial performance data
  - `clinical_trials.csv` - Drug trial efficacy and patient enrollment data
  - Columns: Trial_ID, Drug_Compound, Patient_Count, Efficacy_Score, Trial_Phase

### Financial Services
- **`metrobank_analytics/`** - Banking portfolio risk analysis
  - `portfolio_risk_data.csv` - Loan portfolio performance by type and risk grade
  - Columns: loan_type, risk_grade, quarter, default_rate, portfolio_value

### Retail & E-commerce
- **`retailmax_analytics/`** - Store performance optimization and inventory management
  - `store_performance.csv` - Store performance metrics across regions and quarters
  - Columns: store_id, region, monthly_sales, inventory_turnover, customer_traffic

### Sports & Entertainment
- **`Diamond Analytics Corp/`** - Baseball player performance analytics
  - `player_analytics.csv` - Player performance metrics and statistics
  - Columns: player_name, position, batting_avg, home_runs, ops

### Environmental & Climate
- **`pacific_climate_observatory/`** - Weather monitoring data
  - `weather_data.csv` - Multi-station weather measurements over time
  - Columns: date, station, temperature_f, precipitation_inches, pressure_inhg

All datasets are designed to be small (300-500 rows, max 5 columns) and contain clear trends suitable for exploratory data analysis, visualization, and interactive application development.