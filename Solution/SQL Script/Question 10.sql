WITH Temp_Category AS (
    SELECT 
        ff.City_id,
        YEAR(STR_TO_DATE(d.date, '%Y-%m-%d')) AS Year,
        MONTH(STR_TO_DATE(d.date, '%Y-%m-%d')) AS Month,
        AVG(ff.temperature) AS Avg_Temperature,
        CASE
            WHEN AVG(ff.temperature) < 273.15 THEN 'Extreme Cold'
            WHEN AVG(ff.temperature) > 308.15 THEN 'Extreme Heat'
            ELSE 'Normal'
        END AS Temperature_Category
    FROM 
        final_fact ff
    JOIN 
        date_lookup d ON ff.date_id = d.date_id
    WHERE 
        ff.temperature IS NOT NULL
    GROUP BY 
        ff.City_id,
        Year,
        Month
    HAVING 
        Temperature_Category <> 'Normal'
)
SELECT 
    cl.City,
    MIN(d.date) AS Start_Date,
    MAX(d.date) AS End_Date,
    DATEDIFF(MAX(d.date), MIN(d.date)) + 1 AS Duration_Days,
    tc.Temperature_Category
FROM 
    Temp_Category tc
JOIN 
    city_lookup cl ON tc.City_id = cl.City_id
JOIN 
    date_lookup d ON tc.Year = YEAR(STR_TO_DATE(d.date, '%Y-%m-%d')) AND tc.Month = MONTH(STR_TO_DATE(d.date, '%Y-%m-%d'))
GROUP BY 
    cl.City,
    tc.Temperature_Category
ORDER BY 
    Start_Date;
