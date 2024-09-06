-- Create the countries table with a composite primary key (id, year)
CREATE TABLE countries (
    id VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    year BIGINT NOT NULL,
    surface BIGINT,
    population BIGINT,
    GDP BIGINT,
    PRIMARY KEY (id, year)
);

-- Create the ecology table with foreign key references to the countries table
CREATE TABLE ecology (
    id VARCHAR(255) NOT NULL,
    year BIGINT NOT NULL,
    reshare FLOAT,
    resind FLOAT,
    restemp FLOAT,
    restrans FLOAT,
    greenhouse FLOAT,
    emission FLOAT,
    emisprod FLOAT,
    emiscap FLOAT,
    PRIMARY KEY (id, year),
    FOREIGN KEY (id, year) REFERENCES countries(id, year)
);

-- Create the electricity table with foreign key references to the countries table
CREATE TABLE electricity (
    id VARCHAR(255) NOT NULL,
    year BIGINT NOT NULL,
    elprod BIGINT,
    elres BIGINT,
    eldom BIGINT,
    elfin BIGINT,
    resel FLOAT,
    gdpint FLOAT,
    elconhouse FLOAT,
    eldepend FLOAT,
    PRIMARY KEY (id, year),
    FOREIGN KEY (id, year) REFERENCES countries(id, year)
);

-- Create the energy table with foreign key references to the countries table
CREATE TABLE energy (
    id VARCHAR(255) NOT NULL,
    year BIGINT NOT NULL,
    enprim BIGINT,
    endom BIGINT,
    enint FLOAT,
    import BIGINT,
    fincons BIGINT,
    consap FLOAT,
    conshouse FLOAT,
    finint FLOAT,
    endepend FLOAT,
    PRIMARY KEY (id, year),
    FOREIGN KEY (id, year) REFERENCES countries(id, year)
);