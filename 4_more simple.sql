-- s1.Average Energy Import by Year

SELECT 
    energy.year,
    ROUND (AVG(energy.import), 2) AS avg_energy_import
FROM 
    energy
GROUP BY 
    energy.year
ORDER BY 
    avg_energy_import DESC;

-- s2.Total Final Energy Consumption by Year

SELECT 
    energy.year,
    SUM(energy.fincons) AS total_final_energy_consumption
FROM 
    energy
GROUP BY 
    energy.year
ORDER BY 
    total_final_energy_consumption DESC;

-- s3.Average Electricity Consumption in Households by Year

SELECT 
    year,
    ROUND(AVG(CAST(elconhouse AS numeric)), 3) AS avg_electricity_consumption_households
FROM 
    electricity
GROUP BY 
    year
ORDER BY 
    electricity.year;

-- Year with Maximum GDP and Corresponding Population


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
    avg_electricity_consumption_households DESC;


-- s4.Total Renewable Energy Share by Year
SELECT 
    ecology.year,
    round (AVG(CAST(ecology.reshare AS numeric)), 2) AS average_renewable_energy_share
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

    average_renewable_energy_share DESC;