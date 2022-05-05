/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

/* 1st task */ 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'Feb 3, 2020', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'Nov 15, 2018', 2, TRUE, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'Jan 7, 2021', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11);

/* 2nd task */ 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'Feb 8, 2020', 0, FALSE, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'Nov 15, 2021', 2, TRUE, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'Apr 2, 1993', 3, FALSE, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'Jun 12, 2005', 1, TRUE, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'Jun 7, 2005', 7, TRUE, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'Oct 13, 1998', 3, TRUE, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22);

/* 3rd task */ 

INSERT INTO owners ( full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners ( full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners ( full_name, age) VALUES ('Bob', 45);
INSERT INTO owners ( full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners ( full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners ( full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

BEGIN;
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name LIKE 'Agumon'; 
UPDATE animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')                                          
WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Plantmon' OR name = 'Devimon';
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')                                         
WHERE name = 'Angemon' OR name = 'Boarmon';
SELECT * FROM animals;
COMMIT;

/* 4th task */ 

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations (species_id, vet_id)
VALUES (
    (SELECT id FROM species WHERE name = 'Pokemon'),
    (SELECT id FROM vets WHERE name = 'Willian Tatcher')
);

INSERT INTO specializations (species_id, vet_id)
VALUES (
    (SELECT id FROM species WHERE name = 'Pokemon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
),
(
    (SELECT id FROM species WHERE name = 'Digimon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
);

INSERT INTO specializations (species_id, vet_id)
VALUES (
    (SELECT id FROM species WHERE name = 'Digimon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness')
);

/* ------ */

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Agumon'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    'May 24, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Agumon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    'Jul 22, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Gabumon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    'Feb 2, 2021'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'Jan 5, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'Mar 8, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'May 14, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Devimon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    'May 4, 2021'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Charmander'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    'Feb 24, 2021'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'Dec 21, 2019'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    'Aug 10, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'Apr 7, 2021'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Squirtle'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    'Sep 29, 2019'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Angemon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    'Oct 3, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Angemon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    'Nov 4, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'Jan 24, 2019'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'May 15, 2019'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'Feb 27, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    'Aug 3, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Blossom'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    'May 24, 2020'
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (
    (SELECT id FROM animals WHERE name = 'Blossom'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    'Jan 11, 2021'
);


/* performance audit */

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';