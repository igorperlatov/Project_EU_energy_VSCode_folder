/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)
*/

-- Copy data into the countries table
COPY countries FROM 'D:\IPER\Direction\strategy\studying\DATA\Project_EU_energy_GitHub_folder\data design table\countries.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Copy data into the ecology table
COPY ecology FROM 'D:\IPER\Direction\strategy\studying\DATA\Project_EU_energy_GitHub_folder\data design table\ecology.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Copy data into the electricity table
COPY electricity FROM 'D:\IPER\Direction\strategy\studying\DATA\Project_EU_energy_GitHub_folder\data design table\electricity.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Copy data into the energy table
COPY energy FROM 'D:\IPER\Direction\strategy\studying\DATA\Project_EU_energy_GitHub_folder\data design table\energy.csv' WITH (FORMAT CSV, HEADER, NULL 'NULL');

