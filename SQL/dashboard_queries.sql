
-- Query 1: Funding Activity Over Time

SELECT
    strftime('%Y', fr.funded_at) AS funding_year,
    COUNT(fr.id) AS number_of_funding_rounds,
    SUM(fr.raised_amount_usd) AS total_funding_usd,
    AVG(fr.raised_amount_usd) AS avg_funding_usd
FROM funding_rounds fr
LEFT JOIN objects o
    ON fr.object_id = o.object_id
WHERE fr.funded_at IS NOT NULL
  AND fr.raised_amount_usd > 0
GROUP BY funding_year
ORDER BY funding_year;


-- Query 2: Top Venture Capital Funds

SELECT
    name AS fund_name,
    funded_at,
    funded_year,
    raised_amount,
    raised_currency_code
FROM funds
WHERE raised_amount > 0
ORDER BY raised_amount DESC
LIMIT 10;


-- Query 3: Most Active Investors

SELECT
    o.name AS investor_name,
    o.entity_type AS investor_type,
    o.category_code,
    COUNT(i.id) AS number_of_investments
FROM investments i
LEFT JOIN objects o
    ON i.investor_object_id = o.object_id
WHERE o.name IS NOT NULL
GROUP BY
    o.name,
    o.entity_type,
    o.category_code
ORDER BY number_of_investments DESC
LIMIT 10;


-- Query 4: Acquisition vs IPO Exit Summary

WITH exits AS (
    SELECT
        'Acquisition' AS exit_type,
        acquired_at AS exit_date,
        price_amount AS exit_value
    FROM acquisitions

    UNION ALL

    SELECT
        'IPO' AS exit_type,
        public_at AS exit_date,
        valuation_amount AS exit_value
    FROM ipos
)

SELECT
    exit_type,
    COUNT(*) AS number_of_exits,
    SUM(exit_value) AS total_exit_value,
    AVG(exit_value) AS avg_exit_value
FROM exits
GROUP BY exit_type
ORDER BY number_of_exits DESC;


-- Query 5: Largest Exit Events

WITH exits AS (
    SELECT
        'Acquisition' AS exit_type,
        acquired_object_id AS company_id,
        acquired_at AS exit_date,
        price_amount AS exit_value
    FROM acquisitions

    UNION ALL

    SELECT
        'IPO' AS exit_type,
        object_id AS company_id,
        public_at AS exit_date,
        valuation_amount AS exit_value
    FROM ipos
)

SELECT
    o.name AS company_name,
    o.category_code,
    o.status,
    e.exit_type,
    e.exit_date,
    e.exit_value
FROM exits e
LEFT JOIN objects o
    ON e.company_id = o.object_id
WHERE e.exit_value > 0
ORDER BY e.exit_value DESC
LIMIT 10;


