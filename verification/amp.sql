  SELECT 
    DATE(event_time) AS date,
    COUNT(*) AS amp_users
  FROM foundation_views.application_events.amplitude_'<<PRODUCT>>' -- add product suffix here
  WHERE event_time >= CURRENT_DATE() - INTERVAL 30 DAY
    AND event_time < CURRENT_DATE()
    AND event_type = 'Verification Successful'
  GROUP BY 1
