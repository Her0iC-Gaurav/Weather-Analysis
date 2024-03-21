SELECT
    cl.City,
    MONTH(dl.date) AS Seasonal_Month,
    ff.weather_description,
    COUNT(*) AS Rainy_Days
FROM
    final_fact AS ff
JOIN
    city_lookup AS cl ON ff.City_id = cl.City_id
JOIN
    date_lookup AS dl ON ff.date_id = dl.date_id
WHERE
    ff.weather_description LIKE '%rain'
GROUP BY
    cl.City,
    Seasonal_Month,
    ff.weather_description
ORDER BY
    Rainy_Days DESC
LIMIT 3;
