SELECT 
    f.weather_description,
    f.wind_speed,
    f.wind_direction,
    CASE 
        WHEN f.weather_description IN ('hurricane', 'tornado', 'ragged thunderstorm', 
        'thunderstorm with heavy rain', 'thunderstorm with heavy drizzle', 
        'thunderstorm with heavy drizzle', 'thunderstorm with heavy rain', 
        'heavy thunderstorm', 'thunderstorm with rain', 'thunderstorm with light rain', 
        'thunderstorm with light drizzle') 
        THEN 'Severe'
        WHEN f.weather_description IN ('storm', 'heavy intensity rain', 'heavy snow', 
        'heavy shower snow', 'heavy intensity shower rain', 'heavy intensity drizzle', 
        'heavy intensity drizzle rain', 'sleet', 'freezing rain', 'squalls') 
        THEN 'Moderate'
        WHEN f.weather_description IN ('mist', 'fog', 'dust', 'smoke', 'haze', 'sand', 
        'volcanic ash', 'sand/dust whirls', 'proximity sand/dust whirls', 'ragged shower rain', 
        'proximity shower rain', 'proximity moderate rain', 'proximity thunderstorm', 
        'proximity thunderstorm with drizzle', 'proximity thunderstorm with rain') 
        THEN 'Low'
        ELSE 'Normal'
    END AS event_severity,
    COUNT(*) AS event_count
FROM 
    final_fact AS f
JOIN 
    city_attributes AS ca ON f.City_id = ca.City_id
JOIN 
    country AS c ON ca.Country_id = c.Country_id
WHERE 
    ((c.Country = 'USA' AND ca.Latitude BETWEEN 24 AND 49 AND ca.Latitude IS NOT NULL) -- Latitude range for USA
    OR (c.Country = 'Canada' AND ca.Latitude BETWEEN 42 AND 83 AND ca.Latitude IS NOT NULL) -- Latitude range for Canada
    OR (c.Country = 'Israel' AND ca.Latitude BETWEEN 29 AND 33 AND ca.Latitude IS NOT NULL)) -- Latitude range for Israel
    AND EXISTS (
        SELECT 1 
        FROM city_attributes AS ca_coastal
        WHERE 
            ca_coastal.City_id = ca.City_id 
            AND (ca_coastal.Latitude BETWEEN -90 AND 90)  -- Assuming -90 to 90 latitude represents coastal cities
            AND (ca_coastal.Longitude BETWEEN -180 AND 180)  -- Assuming -180 to 180 longitude represents coastal cities
    )
GROUP BY 
    f.weather_description,
    f.wind_speed,
    f.wind_direction,
    event_severity;
