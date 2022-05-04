/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);

/* 1st task */ 

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(300),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL 
);

/* 2nd task */ 

ALTER TABLE animals
ADD COLUMN species VARCHAR(400);

/* 3rd task */ 

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(300),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(300),
    PRIMARY KEY(id)
);

ALTER TABLE animals
ADD PRIMARY KEY(id);

ALTER TABLE animals
DROP COLUMN IF EXISTS species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT species_fkey FOREIGN KEY (species_id)
REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT owner_fkey FOREIGN KEY (owner_id)
REFERENCES owners(id) ON DELETE CASCADE;

/* 4th task */ 

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(300),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits(
    animal_id INT,
    vet_id INT,
    date_of_visit DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (animal_id) REFERENCES animals(id)
);