SELECT
    cl.City,
    c.Country,
    dl.date,
    f.temperature,
    f.weather_description,
    thresholds.lower_threshold,
    thresholds.upper_threshold
FROM
    final_fact f
JOIN
    city_lookup cl ON f.City_id = cl.City_id
JOIN
    city_attributes ca ON f.City_id = ca.City_id
JOIN
    country c ON ca.Country_id = c.Country_id
JOIN
	date_lookup dl ON f.date_id = dl.date_id
JOIN (
    SELECT 
        (AVG(temperature) - 3 * SQRT(SUM(POW(temperature - mean_temperature, 2)) / COUNT(*))) AS lower_threshold,
        (AVG(temperature) + 3 * SQRT(SUM(POW(temperature - mean_temperature, 2)) / COUNT(*))) AS upper_threshold
    FROM final_fact
    CROSS JOIN (SELECT AVG(temperature) AS mean_temperature FROM final_fact) AS mean_table
) AS thresholds ON 1=1  -- Dummy join condition to ensure the thresholds are applied to all rows
WHERE
    -- Filter anomalies based on the calculated thresholds
    f.temperature < thresholds.lower_threshold
    OR f.temperature > thresholds.upper_threshold;


