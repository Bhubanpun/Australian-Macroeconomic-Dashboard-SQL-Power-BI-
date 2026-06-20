## Australian Macroeconomic Dashboard (SQL + Power BI)
# Project Overview
This project analyzes Australian macroeconomic indicators from 1990 to 2026 using SQL Server and Power BI. It explores key economic variables such as GDP, inflation, unemployment, and interest rates to understand long-term economic trends and relationships.
<img width="1132" height="640" alt="image" src="https://github.com/user-attachments/assets/408f267a-f82f-478a-8fee-c40f243415f7" />

# Key Insights
- Negative GDP growth is generally followed by higher unemployment
- Highest unemployment recorded: 11.28% (March 1993)
- Highest inflation recorded: 7.86% (December 2022)
- Clear relationships observed between inflation, GDP growth, unemployment, and interest rates across different economic cycles.

# Dataset
- The analysis uses the following datasets:
- Quarterly CPI data
- Quarterly Real GDP
- Monthly unemployment rate
- Monthly cash/interest rate

# Tools Used
- SQL Server Management Studio (SSMS)
- Power BI
- Excel (CSV import)

# Methodology
- Imported CSV files into SQL Server
- Cleaned and validated data
- Used SQL window functions (LAG) to calculate inflation
- Joined multiple datasets into a unified view
- Created final dataset for Power BI dashboard

# Dashboard Features
- KPI cards (GDP, inflation, unemployment)
- Time series analysis of macro indicators
- GDP growth trends
- Inflation vs unemployment scatter plot
