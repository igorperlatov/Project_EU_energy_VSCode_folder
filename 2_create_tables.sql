-- Creating table countries 
CREATE TABLE IF NOT EXISTS countries
(
    id TEXT PRIMARY KEY,
    country TEXT,
    year INT,
    surface INT,
    population INT,
    GDP INT
);

-- Creating table ecology
CREATE TABLE IF NOT EXISTS ecology
(
    id TEXT,
    year INT,
    reshare TEXT,
    resind TEXT,
    restemp TEXT,
    restrans TEXT,
    greenhouse TEXT,
    emission TEXT,
    emisprod TEXT,
    emiscap TEXT,
    PRIMARY KEY (id, year),
    FOREIGN KEY (id) REFERENCES countries(id)
);

-- Creating table electricity
CREATE TABLE IF NOT EXISTS electricity
(
    id TEXT,
    year INT,
    elprod INT,
    elres INT,
    eldom INT,
    elfin INT,
    resel TEXT,
    gdpint TEXT,
    elconhouse TEXT,
    eldepend TEXT,
    PRIMARY KEY (id, year),
    FOREIGN KEY (id) REFERENCES countries(id)
);

-- Creating table energy
CREATE TABLE IF NOT EXISTS energy
(
    id TEXT,
    year INT,
    enprim INT,
    endom INT,
    enint INT,
    import INT,
    fincons INT,
    consap TEXT,
    conshouse TEXT,
    finint TEXT,
    endepend TEXT,
    PRIMARY KEY (id, year),
    FOREIGN KEY (id) REFERENCES countries(id)
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.countries OWNER to postgres;
ALTER TABLE public.ecology OWNER to postgres;
ALTER TABLE public.electricity OWNER to postgres;
ALTER TABLE public.energy OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX IF NOT EXISTS idx_country_id_ecology ON public.ecology (id);
CREATE INDEX IF NOT EXISTS idx_country_id_electricity ON public.electricity (id);
CREATE INDEX IF NOT EXISTS idx_country_id_energy ON public.energy (id);

