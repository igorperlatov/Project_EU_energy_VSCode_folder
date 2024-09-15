
-- c1.Average Renewable Energy Share and Greenhouse Gas Emissions by Year with Total Energy Consumption

SELECT 
    ecology.year,
    ROUND (AVG(CAST(ecology.reshare AS numeric)), 2) AS avg_renewable_energy_share,
    ROUND (AVG(CAST(ecology.greenhouse AS numeric)), 2) AS avg_greenhouse_gas_emissions,
    (SELECT SUM(energy.enprim) FROM energy WHERE energy.year = ecology.year) AS total_energy_consumption
FROM 
    ecology
GROUP BY 
    ecology.year
ORDER BY 
    avg_renewable_energy_share DESC;

-- c2.Year with Maximum Greenhouse Gas Emissions and Corresponding Energy Dependency

SELECT 
    ecology.year,
    MAX(ecology.greenhouse),
    (SELECT ROUND (AVG(energy.endepend), 2) FROM energy WHERE energy.year = ecology.year) AS energy_dependency
FROM 
    ecology
WHERE 
    CAST(ecology.greenhouse AS numeric) = (
        SELECT MAX(CAST(greenhouse AS numeric)) 
        FROM ecology
    )
    GROUP BY ecology.year
ORDER BY 
    MAX(ecology.greenhouse);

-- c3.Total Electricity Production by Year with Average GDP and Population

SELECT 
    electricity.year,
    SUM(electricity.elprod) AS total_electricity_production,
    (SELECT ROUND (AVG(countries.GDP), 2) FROM countries WHERE countries.year = electricity.year) AS avg_GDP,
    (SELECT ROUND (AVG(countries.population), 2) FROM countries WHERE countries.year = electricity.year) AS avg_population
FROM 
    electricity
GROUP BY 
    electricity.year
ORDER BY 
    avg_GDP DESC;

-- c4.Year with Maximum Population and Corresponding Electricity Production

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

-- c5.Cumulative Sum of Energy Consumption by Year

SELECT 
    year,
    SUM(enprim) AS yearly_energy_consumption,
    SUM(SUM(enprim)) OVER (ORDER BY year) AS cumulative_energy_consumption
FROM 
    energy
GROUP BY 
    year
ORDER BY 
    cumulative_energy_consumption DESC;

-- c6.Selecting country with maximal GDP and population for each year 

WITH MaxGDP AS (
    SELECT 
        year,
        MAX(GDP) AS max_GDP
    FROM 
        countries
    WHERE 
        id NOT LIKE 'UE%'
    GROUP BY 
        year
),
MaxPopulation AS (
    SELECT 
        year,
        MAX(population) AS max_population
    FROM 
        countries
    WHERE 
        id NOT LIKE 'UE%'
    GROUP BY 
        year
)
SELECT 
    mg.year,
    c1.id AS country_with_max_GDP,
    mg.max_GDP,
    c2.id AS country_with_max_population,
    mp.max_population
FROM 
    MaxGDP mg
JOIN 
    countries c1 ON mg.year = c1.year AND mg.max_GDP = c1.GDP
JOIN 
    MaxPopulation mp ON mg.year = mp.year
JOIN 
    countries c2 ON mp.year = c2.year AND mp.max_population = c2.population
WHERE 
    c1.id NOT LIKE 'UE%' AND c2.id NOT LIKE 'UE%'
ORDER BY 
    mg.year;