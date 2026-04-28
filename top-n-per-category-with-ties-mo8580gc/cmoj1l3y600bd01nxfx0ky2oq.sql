WITH product_totals AS (
    SELECT
        p.category,
        p.product_id,
        p.product_name,
        SUM(s.revenue) AS total_revenue
    FROM products p
    JOIN sales s
        ON s.product_id = p.product_id
    GROUP BY
        p.category,
        p.product_id,
        p.product_name
),
ranked AS (
    SELECT
        category,
        product_id,
        product_name,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS rank_in_category,
        total_revenue
    FROM product_totals
),
selected AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC, product_id ASC
        ) AS global_row
    FROM ranked
)
SELECT
    category,
    product_id,
    product_name,
    rank_in_category,
    total_revenue
FROM selected
WHERE global_row <= 3
ORDER BY
    category ASC,
    rank_in_category ASC,
    product_id ASC;