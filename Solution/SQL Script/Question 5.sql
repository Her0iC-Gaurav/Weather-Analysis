WITH WeatherData AS (
    SELECT 
        cl.City,
        ff.weather_description,
        (COUNT(*) * SUM(ff.humidity * ff.pressure) - SUM(ff.humidity) * SUM(ff.pressure)) /
        (SQRT((COUNT(*) * SUM(ff.humidity * ff.humidity) - SUM(ff.humidity) * SUM(ff.humidity)) *
              (COUNT(*) * SUM(ff.pressure * ff.pressure) - SUM(ff.pressure) * SUM(ff.pressure)))) 
              AS humidity_pressure_correlation
    FROM 
        city_attributes AS ca
    LEFT JOIN 
        final_fact AS ff ON ca.City_id = ff.City_id
    LEFT JOIN 
        city_lookup AS cl ON ff.City_id = cl.City_id
    GROUP BY 
        cl.City, ff.weather_description
)
SELECT 
    City,
    weather_description,
    humidity_pressure_correlation
FROM 
    WeatherData
WHERE 
    humidity_pressure_correlation IS NOT NULL
GROUP BY 1,2