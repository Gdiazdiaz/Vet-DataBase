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
UPDATE animals SET species = 'pokemon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'digimon' WHERE species is null;
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
SELECT MAX(weight_kg) FROM animals GROUP BY species;
SELECT MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;