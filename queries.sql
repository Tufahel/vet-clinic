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

/* 4th task */

SELECT animals.name FROM animals 
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT COUNT (animals.name) FROM animals 
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';

SELECT  vets.name, species.name  FROM species 
JOIN specializations ON species.id = specializations.species_id
RIGHT JOIN vets ON vets.id = specializations.vet_id;

SELECT animals.name, visits.date_of_visit FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN 'April 1, 2020' AND 'Aug 30, 2020';

SELECT animals.name, COUNT(*) FROM visits 
JOIN animals ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY count DESC
LIMIT 1;

SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC
LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id 
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) FROM species  
JOIN specializations ON species.id = specializations.species_id
RIGHT JOIN vets ON vets.id = specializations.vet_id
JOIN visits ON visits.vet_id = vets.id
WHERE species.name IS NULL;

SELECT species.name FROM vets 
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY (species.name)
ORDER BY COUNT (species.name) DESC
Limit 1;

/* performance audit */

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
