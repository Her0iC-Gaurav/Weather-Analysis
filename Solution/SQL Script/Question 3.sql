SELECT 
    ROUND(Latitude, 4) AS Latitude,
    ROUND(Longitude, 4) AS Longitude,
    ROUND(AVG(ff.temperature), 4) AS avg_temperature,
    ROUND(AVG(ff.humidity), 4) AS avg_humidity
FROM 
    city_attributes AS ca
LEFT JOIN 
    final_fact AS ff ON ca.City_id = ff.City_id
GROUP BY 
    ca.Latitude, ca.Longitude;
