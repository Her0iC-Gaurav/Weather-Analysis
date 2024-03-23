SELECT 
    cl.City,
    ff.wind_direction,
    AVG(ff.wind_speed) AS avg_wind_speed,
    AVG(ff.humidity) AS avg_humidity,
    AVG(ff.pressure) AS avg_pressure,
    AVG(ff.temperature) AS avg_temperature,
    COUNT(*) AS total_records
FROM 
    final_fact ff
JOIN 
    city_lookup cl ON ff.City_id = cl.City_id
WHERE 
    ff.wind_direction IS NOT NULL
    AND
    ff.weather_description NOT IN 
    ('Sky is clear', 'Broken clouds', 'Light rain', 'Light intensity drizzle', 'Light snow', 
    'Thunderstorm with light rain', 'Sleet', 'Light rain and snow', 'Drizzle', 'Light shower snow', 
    'Haze', 'Shower snow', 'Light shower sleet', 'Squalls', 'Shower drizzle', 'Rain and snow', 'Ragged shower rain')
    AND
    (
        (cl.City IN ('Vancouver', 'Portland', 'San Francisco', 'Seattle', 'Los Angeles', 'San Diego') 
					AND ff.wind_direction BETWEEN 180 AND 270)
        OR
        (cl.City IN ('Las Vegas', 'Phoenix', 'Albuquerque', 'Denver', 'San Antonio', 'Dallas', 'Houston') 
					AND ff.wind_direction BETWEEN 0 AND 180)
        OR
        (cl.City IN ('Kansas City', 'Minneapolis', 'Saint Louis', 'Chicago', 'Nashville', 'Indianapolis') 
					AND ff.wind_direction BETWEEN 0 AND 180)
        OR
        (cl.City IN ('Atlanta', 'Detroit', 'Jacksonville', 'Charlotte', 'Miami', 'Pittsburgh', 'Toronto', 'Philadelphia', 'New York', 'Montreal', 'Boston') 
					AND ff.wind_direction BETWEEN 0 AND 90)
        OR
        (cl.City IN ('Beersheba', 'Tel Aviv District', 'Eilat', 'Haifa', 'Nahariyya', 'Jerusalem') 
					AND ff.wind_direction BETWEEN 0 AND 180)
    )
GROUP BY 
    cl.City,
    ff.wind_direction;
