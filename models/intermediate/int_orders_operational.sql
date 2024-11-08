SELECT
      s.orders_id,
      s.date_date,
      ROUND((s.margin + p.shipping_fee - (p.logcost + p.ship_cost)),2) AS operational_margin,
      s.revenue,
      s.quantity,
      s.purchase_cost,
      s.margin, 
      p.shipping_fee, 
      p.logcost,
      p.ship_cost
  FROM {{ ref('int_orders_margin') }} AS s
  LEFT JOIN {{ ref('stg_raw__ship') }} AS p
      USING (orders_id) 
    ORDER BY orders_id desc