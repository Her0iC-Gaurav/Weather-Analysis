SELECT 
	ca.City, ca.Country, ca.Latitude, ca.Longitude, 
	wd.wind_direction_value, 
    t.Temp_value
FROM city_attributes ca
JOIN wind_direction wd 
	ON ca.City = wd.wind_direction_city
JOIN temperature t 
    ON ca.City = t.temperature_city
WHERE (ca.Longitude BETWEEN -171 AND -52    -- For America
    OR ca.Longitude BETWEEN -141 AND -53    -- For Canada
    OR (ca.Longitude BETWEEN 34 AND 36     -- For Israel
        AND ca.Latitude BETWEEN 29 AND 34)) -- Israel's coastal latitude range








