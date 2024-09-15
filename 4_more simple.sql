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
