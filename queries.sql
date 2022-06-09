/*Queries that provide answers to the questions from all projects - Part 1.*/

SELECT * FROM ANIMALS WHERE NAME LIKE '%mon';
SELECT NAME FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-12-31';
SELECT NAME FROM ANIMALS WHERE NEUTERED = TRUE AND ESCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH FROM ANIMALS WHERE NAME = 'Agumon' OR NAME = 'Pikachu';
SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG > 10.5;
SELECT * FROM ANIMALS WHERE NEUTERED = TRUE;
SELECT * FROM ANIMALS WHERE NOT NAME = 'Gabumon';
SELECT * FROM ANIMALS WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <=17.3;

/*Queries that provide answers to the questions from all projects - Part 2.*/

BEGIN;
UPDATE animals set species='unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE NAME LIKE '%mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT BEFORE2022;
UPDATE animals SET weight_kg = (weight_kg*-1);
ROLLBACK TO BEFORE2022;
UPDATE animals SET weight_kg = (weight_kg*-1) WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM ANIMALS WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
