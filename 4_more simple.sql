-- Average Energy Import by Year

SELECT 
    energy.year,
    AVG(energy.import) AS avg_energy_import
FROM 
    energy
GROUP BY 
    energy.year
ORDER BY 
    energy.year;

-- Total Final Energy Consumption by Year

SELECT 
    energy.year,
    SUM(energy.fincons) AS total_final_energy_consumption
FROM 
    energy
GROUP BY 
    energy.year
ORDER BY 
    energy.year;

-- Average Electricity Consumption in Households by Year

SELECT 
    electricity.year,
    AVG(CAST(electricity.elconhouse AS FLOAT)) AS avg_electricity_consumption_households
FROM 
    electricity
GROUP BY 
    electricity.year
ORDER BY 
    electricity.year;

Year with Maximum GDP and Corresponding Population


SELECT 
    c1.year,
    c1.GDP,
    c1.population
FROM 
    countries c1
JOIN 
    (SELECT MAX(GDP) AS max_GDP FROM countries) c2
ON 
    c1.GDP = c2.max_GDP
ORDER BY 
    c1.year;

-- Total Renewable Energy Share by Year
SELECT 
    ecology.year,
    SUM(CAST(ecology.reshare AS FLOAT)) AS total_renewable_energy_share
FROM 
    ecology
GROUP BY 
    ecology.year
ORDER BY 
    ecology.year;

-- Year with Maximum Electricity Production and Corresponding GDP

SELECT 
    e.year,
    e.total_electricity_production,
    c.GDP
FROM 
    (SELECT 
        year, 
        SUM(elprod) AS total_electricity_production 
     FROM 
        electricity 
     GROUP BY 
        year 
     ORDER BY 
        total_electricity_production DESC 
     LIMIT 1) e
JOIN 
    countries c
ON 
    e.year = c.year;