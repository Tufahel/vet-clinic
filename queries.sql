/*Queries that provide answers to the questions from all projects.*/

/* 1st task */ 

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN 'JANUARY 1, 2016' AND 'DECEMBER 31, 2019';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* 2nd task */ 

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK:
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > 'JANUARY 1, 2022';
SAVEPOINT remove_younger;
UPDATE animals
SET weight_kg = weight_kg * (-1);
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;


SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals 
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered,AVG(escape_attempts) FROM animals
GROUP BY neutered;

SELECT species,MIN(weight_kg) FROM animals
GROUP BY species;
SELECT species,MAX(weight_kg) FROM animals
GROUP BY species;

SELECT species,AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN 'JANUARY 1, 1990' AND 'DECEMBER 31, 2000'
GROUP BY species;

/* 3rd task */ 

SELECT * FROM animals
JOIN owners ON owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT * FROM animals
JOIN species ON species_id = species.id
WHERE species.name = 'Pokemon';

SELECT * FROM owners
FULL OUTER JOIN animals
ON owners.id = animals.id;

SELECT species.name, COUNT(*)
FROM species
LEFT JOIN animals
ON species.id = animals.species_id
GROUP BY species.name;

SELECT * FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' 
AND animals.species_id = (SELECT id from species WHERE name = 'Digimon');

SELECT * FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' 
AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(*)
FROM owners
LEFT JOIN animals
ON owners.id =  animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT DESC
LIMIT 1;