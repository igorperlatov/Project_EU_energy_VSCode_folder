-- Average Renewable Energy Share and Greenhouse Gas Emissions by Year with Total Energy Consumption

SELECT 
    ecology.year,
    AVG(CAST(ecology.reshare AS FLOAT)) AS avg_renewable_energy_share,
    AVG(CAST(ecology.greenhouse AS FLOAT)) AS avg_greenhouse_gas_emissions,
    (SELECT SUM(energy.enprim) FROM energy WHERE energy.year = ecology.year) AS total_energy_consumption
FROM 
    ecology
GROUP BY 
    ecology.year
ORDER BY 
    ecology.year;




-- Year with Maximum Greenhouse Gas Emissions and Corresponding Energy Dependency

SELECT 
    ecology.year,
    ecology.greenhouse,
    (SELECT MAX(energy.endepend) FROM energy WHERE energy.year = ecology.year) AS energy_dependency
FROM 
    ecology
WHERE 
    CAST(ecology.greenhouse AS FLOAT) = (
        SELECT MAX(CAST(greenhouse AS FLOAT)) 
        FROM ecology
    )
ORDER BY 
    ecology.year;



-- Total Electricity Production by Year with Average GDP and Population

SELECT 
    electricity.year,
    SUM(electricity.elprod) AS total_electricity_production,
    (SELECT AVG(countries.GDP) FROM countries WHERE countries.year = electricity.year) AS avg_GDP,
    (SELECT AVG(countries.population) FROM countries WHERE countries.year = electricity.year) AS avg_population
FROM 
    electricity
GROUP BY 
    electricity.year
ORDER BY 
    electricity.year;

-- Year with Maximum Population and Corresponding Electricity Production

SELECT 
    countries.year,
    countries.population,
    (SELECT SUM(electricity.elprod) FROM electricity WHERE electricity.year = countries.year) AS total_electricity_production
FROM 
    countries
WHERE 
    countries.population = (
        SELECT MAX(population) 
        FROM countries
    )
ORDER BY 
    countries.year;

-- Cumulative Sum of Energy Consumption by Year

SELECT 
    energy.year,
    energy.enprim,
    SUM(energy.enprim) OVER (ORDER BY energy.year) AS cumulative_energy_consumption
FROM 
    energy
ORDER BY 
    energy.year;


-- Rank of Years by Greenhouse Gas Emissions

SELECT 
    ecology.year,
    ecology.greenhouse,
    RANK() OVER (ORDER BY CAST(ecology.greenhouse AS FLOAT) DESC) AS rank_by_emissions
FROM 
    ecology
ORDER BY 
    ecology.year;