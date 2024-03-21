SELECT
    cl.City,
    c.Country,
    MAX(ca.Latitude) AS Max_Latitude,
    CASE
        WHEN MAX(ca.Latitude) > 60 THEN 'Extreme Latitude'
        WHEN MAX(ca.Latitude) > 45 THEN 'High Latitude'
        ELSE 'Normal Latitude'
    END AS Latitude_Category,
    f.weather_description
FROM
    city_attributes AS ca
JOIN
    final_fact AS f ON ca.City_id = f.City_id
JOIN
    city_lookup AS cl ON ca.City_id = cl.City_id
JOIN 
    country AS c ON ca.Country_id = c.Country_id
WHERE
    f.weather_description IS NOT NULL
GROUP BY 
    cl.City,
    c.Country,
    f.weather_description
HAVING 
    Latitude_Category IN ('Extreme Latitude', 'High Latitude')
ORDER BY Max_Latitude DESC;
