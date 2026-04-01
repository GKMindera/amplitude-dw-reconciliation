  SELECT 
    DATE(event_time) AS date,
    COUNT(*) AS deposit_count
  FROM foundation_views.application_events.amplitude_'<<PRODUCT>>' -- append Amplitude table suffix here e.g 'sportsbook'
  WHERE event_time >= CURRENT_DATE()  - INTERVAL 30 DAY
    AND event_time < CURRENT_DATE() 
    AND event_type = 'FTD'
    AND event_properties['Product'] = '<<AMPLITUDE_PRODUCT>>' -- e.g 'sportsbook_cpe' 
  GROUP BY DATE(event_time)
