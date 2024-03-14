Problem Statement
Analyze weather trends, seasonal variations, and correlations between weather attributes. Use Excel and SQL to gain insights and their impact. Develop a Power BI dashboard for weather monitoring and historical weather analysis.

Dataset Description
This dataset includes data on city attributes, humidity, pressure, temperature, weather descriptions, wind direction, and wind speed for various cities.

Table Explanations
City_attributes:
Purpose: This file provides metadata about each city that is covered in the dataset. Columns: City: The name of the city. Country: The country in which the city is located. Latitude: The geographical latitude of the city. Longitude: The geographical longitude of the city. Usage: This file can be used to map cities to their respective countries and geographical coordinates. It can also be useful if one wants to perform location-based analysis or visualization on a map.

Humidity:
Purpose: Contains hourly data representing the humidity levels in each city. Columns: Datetime: The specific hour for which the data is recorded. City Columns: Each city has its own column, and under each city column, the humidity level for that hour is recorded. Usage: Useful for analyzing humidity trends, understanding seasonal variations, or correlating humidity with other factors.

Pressure:
Purpose: Provides hourly data about the air pressure levels in each city. Columns: Datetime: The specific hour for which the data is recorded. City Columns: Each city has its own column, and under each city column, the air pressure level for that hour is recorded. Usage: Can be used to study pressure patterns, predict weather changes, or understand the relationship between pressure and other weather attributes.

Temperature:
Purpose: Contains hourly temperature data for each city. Columns: Datetime: The specific hour for which the data is recorded. City Columns: Each city has its own column, and under each city column, the temperature for that hour is recorded. Usage: Vital for studying temperature trends, understanding heatwaves or cold spells, and correlating temperature with factors like energy consumption.

Weather_description:
Purpose: Provides a textual description of the weather for each city on an hourly basis. Columns: Datetime: The specific hour for which the data is recorded. City Columns: Each city has its own column, and under each city column, the weather description for that hour is provided (e.g., "clear sky", "rainy", "cloudy", etc.). Usage: Useful for understanding the qualitative aspects of weather, categorizing weather types, or analyzing the frequency of certain weather conditions.

Wind_direction:
Purpose: Contains data about the direction from which the wind is blowing on an hourly basis for each city. Columns: Datetime: The specific hour for which the data is recorded. City Columns: Each city has its own column, and under each city column, the wind direction for that hour is recorded (usually in degrees). Usage: Can be used to study wind patterns, predict potential wind-related events, or understand the relationship between wind direction and other factors like pollution dispersion.

Wind_speed:
Purpose: Provides hourly data about the speed of the wind in each city. Columns: Datetime: The specific hour for which the data is recorded. City Columns: Each city has its own column, and under each city column, the wind speed for that hour is recorded (usually in km/h or m/s). Usage: Vital for understanding wind patterns, predicting potential wind-related hazards, or studying the impact of wind speed on various activities.
