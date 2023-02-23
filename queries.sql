/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu'
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5
SELECT name FROM animals WHERE neutered = true
SELECT name FROM animals WHERE name != 'Gabumon'
SELECT name, weight_kg FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3

/* DAY 2 */

UPDATE animals SET species = 'unspecified' WHERE species is null;
ROLLBACK
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is null;
BEGIN;
DELETE from animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

/* Answer questions */

SELECT count(name) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts <= 0
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* DAY 3 */

SELECT name
  FROM animals 
  JOIN owners ON animals.owner_id = owners.id
 WHERE full_name='Melody Pond';

 SELECT animals.name
  FROM animals 
  JOIN species ON animals.species_id = species.id
 WHERE species.name='pokemon';

SELECT animals.name, owners.full_name
  FROM owners 
  LEFT JOIN animals ON animals.owner_id = owners.id;

SELECT species.name, count(*) FROM species
JOIN animals ON animals.species_id=species.id
GROUP BY species.name;

SELECT animals.name FROM animals
JOIN owners ON owners.id=animals.owner_id
JOIN species ON species.id=animals.species_id
WHERE owners.full_name='Jennifer Orwell' AND species.name = 'digimon';

SELECT name FROM animals
JOIN owners ON owners.id=animals.owner_id
WHERE owners.full_name='Dean Winchester' AND animals.escape_attempts =0;

SELECT full_name, COUNT(animals.name) FROM owners
LEFT JOIN animals ON owners.id=animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT DESC
LIMIT 1;

/* DAY-4 */

SELECT MAX(date_of_visit), animals.name FROM animals
JOIN visits ON visits.animal_id=animals.id
JOIN vets ON visits.vet_id=vets.id
WHERE vets.name= 'William Tatcher'
GROUP BY animals.name
LIMIT 1;

SELECT COUNT( DISTINCT animals.name) FROM animals
JOIN visits ON visits.animal_id=animals.id
JOIN vets ON visits.vet_id=vets.id
WHERE vets.name= 'Stephanie Mendez'
GROUP BY vets.name;

SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON species.id=specializations.species_id

SELECT visits.date_of_visit, animals.name FROM animals
JOIN visits ON visits.animal_id=animals.id
JOIN vets ON visits.vet_id=vets.id
WHERE vets.name='Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020/04/01' AND '2020/08/30'

Select animals.name, COUNT(animals.name) FROM visits
JOIN animals ON animals.id=visits.animal_id
GROUP BY animals.name
ORDER BY COUNT DESC
LIMIT 1;

SELECT MIN(date_of_visit), animals.name FROM animals
JOIN visits ON visits.animal_id=animals.id
JOIN vets ON visits.vet_id=vets.id
WHERE vets.name= 'Maisy Smith'
GROUP BY animals.name
LIMIT 1;

SELECT  animals.name as animal_name, animals.escape_attempts, animals.neutered, animals.weight_kg, species.name as specie, owners.full_name as owner, owners.age as owner_age, vets.name as vet, vets.age as vet_age, vets.date_of_graduation as vet_date_of_graduation, visits.date_of_visit 
FROM specializations 
JOIN species on species_id=species.id 
JOIN vets on vet_id=vets.id 
LEFT JOIN animals ON species.id = animals.species_id 
JOIN owners on animals.owner_id=owners.id 
JOIN visits ON animals.id=visits.animal_id 
ORDER BY date_of_visit DESC 
LIMIT 1;

SELECT COUNT(vets.name) FROM vets
JOIN visits ON visits.vet_id=vets.id
LEFT JOIN specializations ON vets.id=specializations.vet_id
WHERE species_id is null

SELECT species.name, COUNT(species.name) FROM visits
JOIN animals ON animals.id=visits.animal_id
JOIN species ON animals.species_id=species.id
JOIN vets ON visits.vet_id=vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT DESC
LIMIT 1;
