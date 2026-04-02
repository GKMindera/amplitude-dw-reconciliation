  SELECT 
    DATE(deposit_complete_ts) AS date,
    COUNT(*) AS deposit_count
  FROM core_views.financial.deposits
  WHERE deposit_complete_ts >= CURRENT_DATE()  - INTERVAL 30 DAY
    AND deposit_complete_ts < CURRENT_DATE() 
    AND deposit_product_name = '<<DEPOSIT_PRODUCT_NAME>>" -- e.g 'sportsbook online'
    AND deposit_status = 'completed'
  GROUP BY DATE(deposit_complete_ts)
