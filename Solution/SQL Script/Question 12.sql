SELECT 
    cl.City,
    f.weather_description,
    AVG(f.temperature) AS avg_temperature,
    AVG(f.humidity) AS avg_humidity,
    AVG(f.pressure) AS avg_pressure,
    COUNT(*) AS total_records
FROM 
    final_fact f
LEFT JOIN 
    city_lookup cl ON f.City_id = cl.City_id
LEFT JOIN 
    date_lookup dl ON f.date_id = dl.date_id
WHERE 
    f.temperature IS NOT NULL
    AND f.temperature > 300
GROUP BY 
    cl.City,
    f.weather_description;
