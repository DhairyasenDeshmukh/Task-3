SELECT * FROM task_3.countries_info;

/*Insert Sample Data*/
INSERT INTO countries_info (Country, Population, GDP) VALUES 
('USA', 331000000, 21.4), 
('China', 1439323776, 14.7), 
('India', 1380004385, 2.9), 
('Brazil', 212559417, 2.05);

/*INNER JOIN (Show AQI with country's population)*/
SELECT g.`Country`, g.`City`, g.`AQI Value`, c.`Population`
FROM `global air pollution dataset` g
INNER JOIN countries_info c ON g.`Country` = c.`Country`
ORDER BY g.`AQI Value` DESC
LIMIT 10;

/*LEFT JOIN (Show all AQI data, even if no population info is available)*/
SELECT g.`Country`, g.`City`, g.`AQI Value`, c.`Population`
FROM `global air pollution dataset` g
LEFT JOIN countries_info c ON g.`Country` = c.`Country`;

/*RIGHT JOIN (Show all countries even if no AQI data exists)*/
SELECT g.`Country`, g.`City`, g.`AQI Value`, c.`Population`
FROM `global air pollution dataset` g
RIGHT JOIN countries_info c ON g.`Country` = c.`Country`;