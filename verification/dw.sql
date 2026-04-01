  SELECT 
    DATE(verification_attempt_ts) AS date,
    COUNT(DISTINCT(fanduel_user_id)) AS core_users
  FROM foundation_views.account.verification_attempts
  WHERE verification_attempt_ts >= CURRENT_DATE() - INTERVAL 30 DAY
    AND verification_attempt_ts < CURRENT_DATE()
    AND verification_status_after_attempt = 1
    AND verification_type = 2
    AND performer_id != 1
    AND is_under_age IS FALSE
    AND is_ineligible_state IS FALSE
    AND product_name = '<<PRODUCT_NAME>>' -- add product_name here e.g 'sportsbook'
  GROUP BY 1
