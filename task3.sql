SELECT * FROM task_3.`global air pollution dataset`;

/*DATA CHECKING*/
/*Checking for first 10 Rows*/
SELECT * FROM `global air pollution dataset` LIMIT 10;

/*Counting total records*/
SELECT COUNT(*) FROM `global air pollution dataset` ;

/*Checking for missing data*/
SELECT 
    SUM(Country IS NULL) AS Missing_Country,
    SUM(City IS NULL) AS Missing_City
FROM `global air pollution dataset`;

/*DATA ANALYSIS*/
/*Optimizing queries with indexes*/
CREATE INDEX idx_country ON `global air pollution dataset` (`Country`(100));
CREATE INDEX idx_aqi ON `global air pollution dataset` (`AQI Value`);

/*Top 10 Most Polluted Cities (by AQI Value)*/
SELECT `City`, `Country`, `AQI Value` 
FROM `global air pollution dataset` 
ORDER BY `AQI Value` DESC 
LIMIT 10;

/*Count of cities in each AQI category*/
SELECT `AQI Category`, COUNT(*) AS Count 
FROM `global air pollution dataset` 
GROUP BY `AQI Category`
ORDER BY Count DESC;

/*Avg AQI for each country*/
SELECT `Country`, ROUND(AVG(AQI_Value), 2) AS `Avg AQI` 
FROM `global air pollution dataset` 
GROUP BY `Country` 
ORDER BY `Avg AQI` DESC;

/*Total PM2.5 Levels for each country*/
SELECT `Country`, SUM(`PM2.5 AQI Value`) AS `Total_PM25`
FROM `global air pollution dataset`
GROUP BY `Country`
ORDER BY `Total_PM25` DESC;

/*Cities with worst PM2.5 levels*/
SELECT City, Country, `PM2.5 AQI Value` 
FROM `global air pollution dataset` 
ORDER BY `PM2.5 AQI Value` DESC 
LIMIT 1;

/*Cities with highest No2 Pollution*/
SELECT `City`, `Country`, `PM2.5 AQI Value` 
FROM `global air pollution dataset` 
ORDER BY `PM2.5 AQI Value` DESC 
LIMIT 10;

/*Countries with more than 5 highly polluted cities*/
SELECT `Country`
FROM `global air pollution dataset`
WHERE `AQI Value` > 150
GROUP BY `Country`
HAVING COUNT(`City`) > 5;



