# Data Dictionary

This data dictionary documents the key fields used for the Venture Capital Portfolio and Exit Analytics Dashboard.

## objects.csv

| Column | Description | Used For |
|---|---|---|
| object_id | Unique identifier for each company, investor, person, or organization | Joining with other tables |
| name | Company, investor, or organization name | Dashboard labels |
| entity_type | Type of entity, such as company, financial organization, or person | Classifying records |
| category_code | Industry or business category | Industry analysis |
| status | Current company status | Company context |
| country_code | Country location code | Geographic filtering |

## funding_rounds.csv

| Column | Description | Used For |
|---|---|---|
| id | Unique funding round record ID | Record tracking |
| object_id | Startup/company receiving funding | Joining with objects table |
| funded_at | Date of funding round | Funding trends over time |
| funding_round_type | Type of funding round | Investment type analysis |
| funding_round_code | Funding stage/code | Funding stage analysis |
| raised_amount_usd | Amount raised in USD | KPI: total funding raised |
| funded_year | Year of funding round | Dashboard time-series charts |

## investments.csv

| Column | Description | Used For |
|---|---|---|
| id | Unique investment record ID | Record tracking |
| funding_round_id | Unique ID of the funding round | Joining with funding rounds |
| funded_object_id | Company/startup receiving investment | Joining with company data |
| investor_object_id | Investor providing funding | Identifying active investors |
| created_at | Date investment record was created | Investment activity timeline |
| investment_created_year | Year investment record was created | Dashboard time-series analysis |

## funds.csv

| Column | Description | Used For |
|---|---|---|
| id | Unique fund record ID | Record tracking |
| fund_id | Unique fund identifier | Fund tracking |
| object_id | Venture capital organization associated with the fund | Joining with objects table |
| name | Fund name | Dashboard labels |
| funded_at | Date fund was raised/created | Fund activity over time |
| funded_year | Year fund was raised/created | Dashboard time-series analysis |
| raised_amount | Amount raised by the fund | KPI: largest funds |
| raised_currency_code | Currency of fund amount | Currency context |

## acquisitions.csv

| Column | Description | Used For |
|---|---|---|
| id | Unique acquisition record ID | Record tracking |
| acquisition_id | Unique acquisition identifier | Acquisition tracking |
| acquiring_object_id | Company or organization making the acquisition | Acquirer analysis |
| acquired_object_id | Company/startup being acquired | Joining with company data |
| term_code | Type of acquisition payment | Deal structure context |
| price_amount | Acquisition value | KPI: acquisition value |
| price_currency_code | Currency of acquisition value | Currency context |
| acquired_at | Date acquisition occurred | Acquisition trends over time |
| acquired_year | Year acquisition occurred | Dashboard time-series charts |

## ipos.csv

| Column | Description | Used For |
|---|---|---|
| id | Unique IPO record ID | Record tracking |
| object_id | Company that went public | Joining with objects table |
| valuation_amount | IPO valuation amount | KPI: IPO valuation |
| raised_amount | Amount raised during IPO | IPO performance analysis |
| public_at | IPO date | IPO trends over time |
| stock_symbol | Public stock ticker symbol | Company context |
| ipo_year | Year of IPO | Dashboard time-series charts |
| ipo_month | Month of IPO | Dashboard time-series charts |
