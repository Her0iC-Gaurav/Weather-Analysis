SELECT 
    c.City,
    DATE_FORMAT(STR_TO_DATE(d.date, '%Y-%m-%d'), '%m') AS Month,
    MAX(ff.temperature) AS Max_Temperature,
    MIN(ff.temperature) AS Min_Temperature,
    (MAX(ff.temperature) - MIN(ff.temperature)) AS Temperature_Fluctuation
FROM 
    final_fact ff
JOIN 
    city_lookup c ON ff.City_id = c.City_id
JOIN 
    date_lookup d ON ff.date_id = d.date_id
WHERE 
    ff.temperature IS NOT NULL
GROUP BY 
    c.City,
    Month
ORDER BY 
    Temperature_Fluctuation DESC;
