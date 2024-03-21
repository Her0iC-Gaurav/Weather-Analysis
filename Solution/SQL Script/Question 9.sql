SELECT 
    cl.City,
    CASE WHEN ca.Latitude >= 0 THEN 'Northern Hemisphere' ELSE 'Southern Hemisphere' END AS hemisphere,
    CASE 
        WHEN MONTH(STR_TO_DATE(d.date, '%Y-%m-%d')) BETWEEN 3 AND 5 THEN 'Spring'
        WHEN MONTH(STR_TO_DATE(d.date, '%Y-%m-%d')) BETWEEN 6 AND 8 THEN 'Summer'
        WHEN MONTH(STR_TO_DATE(d.date, '%Y-%m-%d')) BETWEEN 9 AND 11 THEN 'Autumn'
        ELSE 'Winter' 
    END AS season,
    AVG(ff.temperature) AS avg_temperature
FROM 
    final_fact ff
JOIN 
    city_attributes ca ON ff.City_id = ca.City_id
JOIN 
    date_lookup d ON ff.date_id = d.date_id
JOIN 
    city_lookup cl ON ff.City_id = cl.City_id
GROUP BY 
    cl.City, hemisphere, season
ORDER BY 
    hemisphere, season;
