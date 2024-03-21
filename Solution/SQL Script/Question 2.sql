SELECT
    cl.City,
    c.Country,
    ca.Latitude,
    ca.Longitude,
    NumCities
FROM (
    SELECT
        City_id,
        Country_id,
        Latitude,
        Longitude,
        COUNT(*) OVER (PARTITION BY ROUND(Latitude), ROUND(Longitude)) AS NumCities,
        ROW_NUMBER() OVER (PARTITION BY Latitude, Longitude ORDER BY City_id) AS CityOrder
    FROM
        city_attributes
    ) AS ca
JOIN
    city_lookup AS cl 
    ON ca.City_id = cl.City_id
JOIN
    country AS c
    ON ca.Country_id = c.Country_id
WHERE
    NumCities > 1
ORDER BY
    NumCities DESC,
    CityOrder;













    
















