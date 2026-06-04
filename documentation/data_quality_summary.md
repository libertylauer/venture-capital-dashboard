# Data Quality Audit Summary

A data quality audit was conducted on all the datasets before data integration and dashboard development.

## Key Findings

### Acquisitions Dataset

* 2 records contained missing acquisition dates (`acquired_at`).
* Several text fields contained missing values, including source information.
* No significant duplicate records were identified.

### Funds Dataset

* 115 records contained missing fund dates (`funded_at`).
* Missing fund dates impact time-series analysis but do not prevent fund size analysis.
* Currency fields required standardization.

### Investments Dataset

* Some records contained missing join identifiers used to connect investors, companies, and funding rounds.
* These records were removed to preserve referential integrity during future joins.

## Data Cleaning Actions

* Converted date fields to datetime format.
* Standardized currency codes.
* Converted monetary fields to numeric format.
* Created year fields for dashboard reporting.
* Replaced missing text fields with "Unknown".
* Removed duplicate records.
* Removed records with missing key join identifiers where necessary.

## Impact on Analysis

The cleaned datasets are suitable for answering business questions related to venture capital activity, investor participation, fund performance, acquisition trends, and startup exits.
