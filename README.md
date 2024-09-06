<b><h1>EU Energy Sector Performance Analysis</h1></b>

<b><h2>Overview</h2></b>
This project focuses on analyzing key performance indicators in the EU energy sector for the years 2015-2019 and 2021. The data was sourced from the dane.gov.pl website. You can access the original dataset here https://shorturl.at/mO5Oc. During this project i've used PGAdmin, VS Code(PostgreSQL) and PyCharm community version. 

<b><h2>Data Preparation</h2></b>
The original raw tables were not ready for analysis, so several preprocessing steps were undertaken:
1. Translation and Renaming:
    - All Polish words were translated to English.
    - Column names were renamed for clarity.
2. Dataset Division:
    - The main table was divided into four separate datasets.
    - Each dataset was saved as a CSV file with a primary key (id) representing the country or EU abbreviation.
3. Column Renaming and Shortening:
    - Columns were renamed or shortened to make the datasets easier to work with.

<b><h2>Datasets</h2></b>
The project includes four main tables, each described in a separate description file. These tables are <b>Countries</b>, <b>Ecology</b>, <b>Electricity</b>, and <b>Energy</b>. These tables are now ready for analysis in various contexts. 
I've decided to create id - abbreviated country index related to country name. Then i put it in all 4 tables. 

<b><h2>Common Fields</h2></b>
<p>
    <b>id:</b> Appears in all datasets and uniquely identifies each country.
</p>
<p>
    <b>year:</b> Appears in all datasets and can be used to align data temporally.
</p>

<b><h2>Suggested Foreign Key Relationships</h2></b>

<b>Energy Dataset:</b>
<p>
    <b>id</b> and <b>year</b> (foreign keys) reference <b>id</b> and <b>year</b> in the <b>Countries Dataset</b>
</p>

<b>Electricity Dataset:</b>
<p>
    <b>id</b> and <b>year</b> (foreign keys) reference <b>id</b> and <b>year</b> in the <b>Countries Dataset</b>
</p>

<b>Ecology Dataset:</b>
<p>
    <b>id</b> and <b>year</b> (foreign keys) reference <b>id</b> and <b>year</b> in the <b>Countries Dataset</b>
</p>

<b><h2>Collision and Errors</h2></b>
<p>
    After rearranging my data with Pandas in Python to make all floats use a period (.) instead of a comma (,), I faced new collisions:
</p>
<ul>
    <li>Query with errors. Please, check the error below. Double key value violates the uniqueness limitation of "countries_pkey".</li>
    <li>Query with errors. Please, check the error below. Inserting or modifying on the "ecology" table violates the foreign key "ecology_id_fkey".</li>
    <li>Query with errors. Please, check the error below. Inserting or modifying on the table "electricity" violates the foreign key "electricity_id_fkey".</li>
    <li>Query with errors. Please, check the error below. Double key value violates the uniqueness limitation of "energy_pkey".</li>
</ul>
<p>
    Choosing only <b>id</b> as a primary key and foreign key for the other three tables was wrong.
</p>

<b><h2>Corrected Version</h2></b>
<p>
    To resolve the issues, the following changes were made:
</p>
<ul>
    <li>Added a composite primary key consisting of <b>id</b> and <b>year</b> for each table.</li>
    <li>Ensured that the <b>id</b> and <b>year</b> combination is unique across all datasets.</li>
    <li>Updated foreign key relationships to reference both <b>id</b> and <b>year</b> in the <b>Countries Dataset</b>.</li>
</ul>

<b><h2>Suggested Foreign Key Relationships (Corrected)</h2></b>

<b>Energy Dataset:</b>
<p>
    <b>id</b> and <b>year</b> (foreign keys) reference <b>id</b> and <b>year</b> in the <b>Countries Dataset</b>
</p>

<b>Electricity Dataset:</b>
<p>
    <b>id</b> and <b>year</b> (foreign keys) reference <b>id</b> and <b>year</b> in the <b>Countries Dataset</b>
</p>

<b>Ecology Dataset:</b>
<p>
    <b>id</b> and <b>year</b> (foreign keys) reference <b>id</b> and <b>year</b> in the <b>Countries Dataset</b>
</p>



<b><h2>Next Steps</h2></b>
1. Define Analysis Goals:
    - Determine the specific outputs and insights we want to derive from the data.
2. Perform Analysis:
    - Use the prepared datasets to conduct the analysis and generate the desired outputs.

<b><h2>Getting Started</h2></b>
To start working with the data, follow these steps:
1. Download the CSV files from the repository.
2. Refer to the description file for details on each table.
3. Use your preferred data analysis tools to explore and analyze the data.
