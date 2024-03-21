SELECT 
    cl.City, 
    co.Country, 
    ff.wind_direction AS wind_direction, 
    AVG(ff.temperature) AS avg_temperature
FROM 
    city_attributes AS ca
JOIN 
    city_lookup AS cl ON ca.City_id = cl.City_id
JOIN 
    country AS co ON ca.Country_id = co.Country_id
JOIN 
    final_fact AS ff ON ca.City_id = ff.City_id
WHERE 
    ((ca.Longitude BETWEEN -157 AND -81      -- For USA
    AND ca.Latitude BETWEEN 24 AND 72)        -- USA's coastal latitude range
    OR (ca.Longitude BETWEEN -75 AND -52      -- For Canada
    AND ca.Latitude BETWEEN 47 AND 84)        -- Canada's coastal latitude range
    OR (ca.Longitude BETWEEN 33 AND 36       -- For Israel
    AND ca.Latitude BETWEEN 29 AND 35))       -- Israel's coastal latitude range
    AND ff.wind_direction IS NOT NULL        -- Filter out null wind_direction
    AND ff.temperature IS NOT NULL           -- Filter out null temperature
GROUP BY 
    cl.City, 
    co.Country, 
    ff.wind_direction
ORDER BY avg_temperature DESC
