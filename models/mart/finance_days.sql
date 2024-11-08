SELECT
        date_date,
        SUM (orders_id) AS NB_transactions,
        ROUND(SUM (revenue),1) AS Revenue,
        ROUND(AVG (revenue),1) AS average_basket,
        ROUND(SUM (margin),1) AS Margin,
        ROUND(SUM (operational_margin),1) AS Operational_margin,
        ROUND(SUM (purchase_cost),1) AS Purchase_cost,
        ROUND(SUM (shipping_fee),1) AS Shipping_fee, 
        ROUND(SUM (logcost),1) AS Logcost,
        SUM (ship_cost) AS Shipcost, 
        SUM (quantity) AS Quantity
  FROM {{ ref('int_orders_operational') }} 
    GROUP BY date_date 
    ORDER BY date_date DESC