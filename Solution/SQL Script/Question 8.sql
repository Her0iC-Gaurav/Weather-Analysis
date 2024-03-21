SELECT 
    d.date AS Date,
    c.City AS City,
    fd.weather_description AS Weather_Description,
    fd.temperature AS Temperature,
    fd.humidity AS Humidity,
    fd.pressure AS Pressure,
    fd.wind_speed AS Wind_Speed
FROM 
    final_fact fd
JOIN 
    city_lookup c ON fd.City_id = c.City_id
JOIN 
    date_lookup d ON fd.date_id = d.date_id
WHERE 
    fd.weather_description LIKE '%storm%' OR
    fd.weather_description LIKE '%sand%' OR
    fd.weather_description LIKE '%heavy%' OR
    fd.weather_description LIKE '%tornado%' OR
    fd.weather_description LIKE '%sleet%' OR
    fd.weather_description LIKE '%very%' OR
    fd.weather_description LIKE '%freezing%'
ORDER BY 
    d.date;





