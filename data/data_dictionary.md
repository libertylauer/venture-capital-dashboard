# Data Dictionary

The following data dictionary documents the key fields used throughout the Venture Capital Portfolio and Exit Analytics Dashboard project. Only business-critical fields used in analysis, SQL queries, and dashboard development are included.

| Dataset | Field | Description | Business Use |
|----------|----------|----------|----------|
| funding_rounds | raised_amount_usd | Amount raised during the funding round (USD) | Measure funding activity and investment volume |
| objects | category_code | Industry or business category | Industry and sector analysis |
| funds | fund_id | Unique fund identifier | Join fund information with other datasets |
| funds | raised_amount | Total capital raised by the fund | Determine largest venture capital funds |
| investments | investor_object_id | Investor identifier | Identify active investors |
| investments | funded_object_id | Startup receiving investment | Track investment relationships |
| investments | funding_round_id | Funding round identifier | Connect investments to funding activity |
| acquisitions | acquired_object_id | Acquired startup identifier | Link acquisition events to companies |
| acquisitions | price_amount | Acquisition value | Identify highest-value acquisitions |
| acquisitions | term_code | Acquisition payment type | Analyze acquisition structures |
| ipos | public_at | IPO date | Analyze IPO activity over time |
| ipos | valuation_amount | Company valuation at IPO | Identify highest-value IPO events |
| ipos | raised_amount | Capital raised through IPO | Measure IPO fundraising performance |
| ipos | stock_symbol | Public market ticker symbol | Reference publicly traded companies |

## Notes

- `object_id` serves as the primary join key for company-level analysis.
- `funding_round_id` links investment activity to funding rounds.
- Acquisition and IPO datasets are combined to analyze startup exit outcomes.
- Only fields directly supporting the project's business questions are documented.

## Business Questions Supported

1. How has startup funding activity changed over time?
2. Which venture capital funds have raised the most capital?
3. Who are the most active investors?
4. How do startups most commonly exit: acquisition or IPO?
5. What acquisition and IPO events generated the highest valuations?
