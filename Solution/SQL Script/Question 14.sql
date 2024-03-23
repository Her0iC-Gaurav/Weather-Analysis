SELECT 
    cl.City,
    AVG(ff.wind_speed) AS avg_wind_speed,
    MAX(ff.wind_speed) AS max_wind_speed,
    MIN(ff.wind_speed) AS min_wind_speed,
    COUNT(*) AS num_records,
    GROUP_CONCAT(DISTINCT ff.weather_description SEPARATOR ', ') AS weather_descriptions
FROM 
    final_fact ff
JOIN 
    city_lookup cl ON ff.City_id = cl.City_id
JOIN 
    date_lookup dl ON ff.date_id = dl.date_id
WHERE 
    ff.wind_speed > (SELECT 1.5 * STDDEV(wind_speed) + AVG(wind_speed) FROM final_fact) 
    AND ff.weather_description IN (
        'heavy intensity rain',
        'heavy snow',
        'heavy shower snow',
        'very heavy rain',
        'thunderstorm with heavy rain',
        'thunderstorm',
        'thunderstorm with light rain',
        'dust',
        'volcanic ash',
        'heavy intensity shower rain',
        'thunderstorm with rain',
        'sleet',
        'freezing rain',
        'heavy intensity drizzle',
        'squalls',
        'tornado',
        'heavy thunderstorm'
    ) 
GROUP BY 
    cl.City
ORDER BY 
    avg_wind_speed DESC;